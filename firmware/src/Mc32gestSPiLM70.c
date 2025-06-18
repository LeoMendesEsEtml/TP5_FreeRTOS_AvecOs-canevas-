/**
 * @file Mc32gestSPiLM70.c
 * @brief Gestion du capteur de temperature LM70 via SPI
 *
 * @details
 * Ce fichier contient les fonctions pour initialiser et lire la temperature du LM70
 * en utilisant le bus SPI Il fournit l'interface bas niveau pour le module temperature
 *
 * @pre Le SPI doit etre initialise avant utilisation
 * @post Permet la lecture de la temperature brute et sa conversion
 */

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
#include "system/clk/sys_clk.h" // pour appels aux fonctions SYS_CLK_...())

// SPI_ID_1 correspond au SPI 1 !
#define KitSpi1 (SPI_ID_1)

uint32_t ConfigReg;     // pour lecture de SPI1CON
uint32_t BaudReg;       // pour lecture de SPI1BRG

// Definitions du bus
// #define SPI_SCL      PORTDbits.RD10  pin 70
// #define SPI_SDI      PORTCbits.RC4   pin 9
// #define SPI_SDO      PORTDbits.RD0   pin 72
// #define CS_LM70      LATDbits.LATD3  pin 78

// Initialisation de la communication SPI pour le LM70
// ---------------------------------------------------

/**
 * @brief Configure le module SPI pour le capteur LM70
 *
 * @details
 * Cette fonction configure tous les parametres du module SPI pour permettre la communication avec le capteur LM70. Elle regle la frequence, la polarite, la phase et active le mode maitre. Elle lit aussi les registres de configuration pour verification.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Le systeme doit etre initialise avant d'appeler cette fonction.
 * @post Le module SPI est pret pour communiquer avec le LM70.
 */
void SPI_ConfigureLM70(void)
{
   PLIB_SPI_Disable(KitSpi1); // desactive le module spi

   PLIB_SPI_BufferClear(KitSpi1); // vide le buffer spi
   PLIB_SPI_StopInIdleDisable(KitSpi1); // desactive l'arret en idle
   PLIB_SPI_PinEnable(KitSpi1, SPI_PIN_DATA_OUT); // active la sortie data
   PLIB_SPI_CommunicationWidthSelect(KitSpi1, SPI_COMMUNICATION_WIDTH_8BITS); // selectionne 8 bits
   PLIB_SPI_BaudRateSet(KitSpi1, SYS_CLK_PeripheralFrequencyGet(CLK_BUS_PERIPHERAL_1), 5000000); // regle la frequence a 5 MHz
   PLIB_SPI_InputSamplePhaseSelect(KitSpi1, SPI_INPUT_SAMPLING_PHASE_IN_MIDDLE ); // regle la phase d'echantillonnage
   PLIB_SPI_ClockPolaritySelect(KitSpi1, SPI_CLOCK_POLARITY_IDLE_LOW); // regle la polarite de l'horloge
   PLIB_SPI_OutputDataPhaseSelect(KitSpi1, SPI_OUTPUT_DATA_PHASE_ON_IDLE_TO_ACTIVE_CLOCK); // regle la phase de sortie
   PLIB_SPI_MasterEnable(KitSpi1); // active le mode maitre
   PLIB_SPI_FramedCommunicationDisable(KitSpi1); // desactive la communication cadre
   PLIB_SPI_FIFOEnable(KitSpi1); // active le buffer fifo

   PLIB_SPI_Enable(KitSpi1); // active le module spi

   // Contrôle de la configuration
   ConfigReg = SPI1CON;
   BaudReg = SPI1BRG;
}

/**
 * @brief Initialise le capteur de temperature LM70 via SPI
 *
 * @details
 * Cette fonction initialise le capteur LM70 en configurant le SPI et en envoyant les commandes necessaires. Elle met le capteur en etat pret pour la communication.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Le SPI doit etre configure avant d'appeler cette fonction.
 * @post Le capteur LM70 est pret pour la communication.
 */
void SPI_InitLM70(void)  {
   SPI_ConfigureLM70(); // configure le spi pour le lm70
   CS_LM70 = 0; // selectionne le capteur lm70
   spi_read1(0xFF); // envoie une commande de lecture
   spi_read1(0xFF); // envoie une commande de lecture
   spi_read1(0); // envoie une commande de lecture
   spi_read1(0); // envoie une commande de lecture
   CS_LM70 = 1; // deselectionne le capteur lm70
} // SPI_InitLM70

/**
 * @brief Lit la temperature brute du capteur LM70 via SPI
 *
 * @details
 * Cette fonction lit la valeur brute de temperature du capteur LM70 en utilisant le bus SPI. Elle combine les octets lus pour former la valeur complete.
 *
 * @param Aucun parametre.
 * @return int16_t valeur brute de temperature.
 *
 * @pre Le capteur LM70 doit etre initialise avant d'appeler cette fonction.
 * @post Retourne la valeur brute lue du capteur.
 */
int16_t SPI_ReadRawTempLM70(void)
{
   uint8_t MSB; // octet de poids fort
   uint8_t LSB; // octet de poids faible
   int16_t RawTemp; // variable pour la temperature brute
   CS_LM70 = 0; // selectionne le capteur lm70
   MSB = spi_read1(0xFF); // lit l'octet de poids fort
   LSB = spi_read1(0xFF); // lit l'octet de poids faible
   CS_LM70 = 1; // deselectionne le capteur lm70
   RawTemp = MSB; // stocke l'octet de poids fort
   RawTemp = RawTemp << 8; // decale de 8 bits
   RawTemp = RawTemp | LSB; // combine avec l'octet de poids faible
   return RawTemp; // retourne la valeur brute
}

/**
 * @brief Lit la temperature brute du LM70 avec reconfiguration SPI
 *
 * @details
 * Cette fonction reconfigure le SPI puis lit la valeur brute de temperature du capteur LM70. Elle combine les octets lus pour former la valeur complete.
 *
 * @param Aucun parametre.
 * @return int16_t valeur brute de temperature.
 *
 * @pre Le SPI doit etre configure avant d'appeler cette fonction.
 * @post Retourne la valeur brute lue du capteur.
 */
int16_t SPI_CfgReadRawTempLM70(void)
{
   uint8_t MSB; // octet de poids fort
   uint8_t LSB; // octet de poids faible
   int16_t RawTemp; // variable pour la temperature brute
   SPI_ConfigureLM70(); // reconfigure le spi
   CS_LM70 = 0; // selectionne le capteur lm70
   MSB = spi_read1(0xFF); // lit l'octet de poids fort
   LSB = spi_read1(0xFF); // lit l'octet de poids faible
   CS_LM70 = 1; // deselectionne le capteur lm70
   RawTemp = MSB; // stocke l'octet de poids fort
   RawTemp = RawTemp << 8; // decale de 8 bits
   RawTemp = RawTemp | LSB; // combine avec l'octet de poids faible
   return RawTemp; // retourne la valeur brute
}

/**
 * @brief Convertit la valeur brute du LM70 en degres Celsius
 *
 * @details
 * Cette fonction convertit la valeur brute lue du capteur LM70 en degres Celsius et stocke le resultat dans la variable pointee.
 *
 * @param RawTemp valeur brute a convertir.
 * @param PTemp pointeur vers la variable resultat.
 * @return Aucun retour.
 *
 * @pre RawTemp doit etre une valeur valide, PTemp doit etre un pointeur valide.
 * @post PTemp contient la temperature convertie en degres Celsius.
 */
void LM70_ConvRawToDeg( int16_t RawTemp, float *PTemp)
{
    float TempLoc; // variable temporaire pour la temperature
    RawTemp = RawTemp / 32; // division pour garder le signe
    TempLoc = RawTemp * 0.25; // conversion en degres Celsius
    *PTemp = TempLoc; // stocke le resultat dans la variable pointee
}





