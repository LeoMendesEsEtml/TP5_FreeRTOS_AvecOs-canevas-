/*--------------------------------------------------------*/
// Mc32GestSpiLM70.c
/*--------------------------------------------------------*/
//	Description :	Gestion par SPI du capteur temperature LM70 du Kit
//
//	Auteur 		: 	C. Huber
//	Version		:	V1.6    24.05.2016
//	Compilateur	:	XC32 V1.40 + Harmony 1.06
//      Modifications   :
//          CHR 06.03.2015 : Adaptation a plib_spi
//                           Utilisation stdint.h
//                           Ajout fonction SPI_CfgReadRawTempLM70
//          CHR 24.05.2016 : maj version compilateur et Harmony
//          CHR 26.05.2016  utilisation de SYS_CLK_PeripheralFrequencyGet(CLK_BUS_PERIPHERAL_1)
/*--------------------------------------------------------*/



//#include "app.h"   // pour system_config et autre
#include "Mc32gestSpiLM70.h"
#include "Mc32SpiUtil.h"
#include "peripheral\SPI\plib_spi.h"
#include "system/clk/sys_clk.h"

#define KitSpi1 (SPI_ID_1)

uint32_t ConfigReg;
uint32_t BaudReg;

/**
@brief Configure le SPI pour le capteur LM70
@details
Cette fonction configure le peripherique SPI pour communiquer avec le capteur de temperature LM70.
@param Aucun parametre.
@return Aucun retour.
@pre Le peripherique SPI doit etre disponible.
@post Le SPI est configure pour la communication LM70.
*/
void SPI_ConfigureLM70(void)
{
   PLIB_SPI_Disable(KitSpi1); // Desactive le SPI avant configuration
   PLIB_SPI_BufferClear(KitSpi1); // Vide le buffer SPI
   PLIB_SPI_StopInIdleDisable(KitSpi1); // Desactive stop en idle
   PLIB_SPI_PinEnable(KitSpi1, SPI_PIN_DATA_OUT); // Active la broche data out
   PLIB_SPI_CommunicationWidthSelect(KitSpi1, SPI_COMMUNICATION_WIDTH_8BITS); // Mode 8 bits
   PLIB_SPI_BaudRateSet(KitSpi1, SYS_CLK_PeripheralFrequencyGet(CLK_BUS_PERIPHERAL_1), 5000000); // Vitesse 5 MHz
   PLIB_SPI_InputSamplePhaseSelect(KitSpi1, SPI_INPUT_SAMPLING_PHASE_IN_MIDDLE ); // Phase d'echantillonnage
   PLIB_SPI_ClockPolaritySelect(KitSpi1, SPI_CLOCK_POLARITY_IDLE_LOW); // Polarite horloge
   PLIB_SPI_OutputDataPhaseSelect(KitSpi1, SPI_OUTPUT_DATA_PHASE_ON_IDLE_TO_ACTIVE_CLOCK); // Phase de donnees
   PLIB_SPI_MasterEnable(KitSpi1); // Active mode maitre
   PLIB_SPI_FramedCommunicationDisable(KitSpi1); // Desactive mode cadre
   PLIB_SPI_FIFOEnable(KitSpi1); // Active le mode FIFO
   PLIB_SPI_Enable(KitSpi1); // Active le SPI
   ConfigReg = SPI1CON; // Lit le registre SPI1CON
   BaudReg = SPI1BRG; // Lit le registre SPI1BRG
}

/**
@brief Initialise la communication SPI du LM70
@details
Cette fonction initialise la communication SPI pour le capteur LM70 et effectue la configuration initiale.
@param Aucun parametre.
@return Aucun retour.
@pre Le peripherique SPI doit etre configure.
@post Le capteur LM70 est initialise pour la communication SPI.
*/
void SPI_InitLM70(void)  {
   SPI_ConfigureLM70(); // Configure le SPI pour LM70
   CS_LM70 = 0; // Selectionne LM70
   spi_read1(0xFF); // Lecture fictive
   spi_read1(0xFF); // Lecture fictive
   spi_read1(0); // Ecrit 0
   spi_read1(0); // Ecrit 0
   CS_LM70 = 1; // Deselectionne LM70
}

/**
@brief Lit la temperature brute du LM70 (sans reconfiguration)
@details
Cette fonction lit le registre de temperature brute du capteur LM70 sans reconfigurer le SPI.
@param Aucun parametre.
@return Valeur brute de temperature (int16_t).
@pre Le SPI doit etre configure et LM70 connecte.
@post Retourne la valeur brute de temperature du LM70.
*/
int16_t SPI_ReadRawTempLM70(void)
{
   uint8_t MSB; // Octet fort
   uint8_t LSB; // Octet faible
   int16_t RawTemp; // Valeur brute
   CS_LM70 = 0; // Selectionne LM70
   MSB = spi_read1(0xFF); // Lit MSB
   LSB = spi_read1(0xFF); // Lit LSB
   CS_LM70 = 1; // Deselectionne LM70
   RawTemp = MSB; // Affecte MSB
   RawTemp = RawTemp << 8; // Decale MSB
   RawTemp = RawTemp | LSB; // Combine avec LSB
   return RawTemp; // Retourne la valeur brute
}

/**
@brief Lit la temperature brute du LM70 (avec reconfiguration)
@details
Cette fonction reconfigure le SPI et lit le registre de temperature brute du capteur LM70.
@param Aucun parametre.
@return Valeur brute de temperature (int16_t).
@pre Le SPI doit etre disponible et LM70 connecte.
@post Retourne la valeur brute de temperature du LM70.
*/
int16_t SPI_CfgReadRawTempLM70(void)
{
   uint8_t MSB; // Octet fort
   uint8_t LSB; // Octet faible
   int16_t RawTemp; // Valeur brute
   SPI_ConfigureLM70(); // Reconfigure le SPI
   CS_LM70 = 0; // Selectionne LM70
   MSB = spi_read1(0xFF); // Lit MSB
   LSB = spi_read1(0xFF); // Lit LSB
   CS_LM70 = 1; // Deselectionne LM70
   RawTemp = MSB; // Affecte MSB
   RawTemp = RawTemp << 8; // Decale MSB
   RawTemp = RawTemp | LSB; // Combine avec LSB
   return RawTemp; // Retourne la valeur brute
}

/**
@brief Convertit la valeur brute LM70 en degres Celsius
@details
Cette fonction convertit la valeur brute de temperature du capteur LM70 en degres Celsius.
@param RawTemp Valeur brute (int16_t).
@param PTemp Pointeur vers float pour le resultat.
@return Aucun retour.
@pre RawTemp doit etre valide.
@post PTemp contient la temperature en Celsius.
*/
void LM70_ConvRawToDeg( int16_t RawTemp, float *PTemp)
{
    float TempLoc; // Variable locale pour la temperature
    RawTemp = RawTemp / 32; // Division pour garder le signe
    TempLoc = RawTemp * 0.25; // Chaque bit vaut 0.25 degre
    *PTemp = TempLoc; // Stocke le resultat
}





