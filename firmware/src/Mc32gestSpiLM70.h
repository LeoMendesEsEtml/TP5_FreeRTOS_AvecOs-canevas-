/**
 * @file Mc32gestSpiLM70.h
 * @brief Declarations pour la gestion du capteur LM70 via SPI
 *
 * @details
 * Ce fichier contient les prototypes, types et constantes necessaires a la gestion du LM70
 * Il definit l'interface publique pour l'acces SPI au capteur de temperature
 *
 * @pre Le SPI doit etre initialise avant utilisation
 * @post Permet la lecture et la conversion de la temperature LM70
 */

#ifndef Mc32GestSpiLM70_H
#define Mc32GestSpiLM70_H
/*--------------------------------------------------------*/
// Mc32GestSpiLM70.h
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
//          CHR 24.05.2016  maj version compilateur et Harmony 
//
/*--------------------------------------------------------*/



#include <stdint.h>

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
void SPI_InitLM70(void);

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
int16_t SPI_ReadRawTempLM70(void);

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
int16_t SPI_CfgReadRawTempLM70(void);

/**
 * @brief Convertit la valeur brute du LM70 en degres Celsius
 *
 * @details
 * Cette fonction convertit la valeur brute lue du capteur LM70 en degres Celsius et stocke le resultat dans la variable pointee.
 *
 * @param raw valeur brute a convertir.
 * @param degC pointeur vers la variable resultat.
 * @return Aucun retour.
 *
 * @pre raw doit etre une valeur valide, degC doit etre un pointeur valide.
 * @post degC contient la temperature convertie en degres Celsius.
 */
void LM70_ConvRawToDeg(int16_t raw, float* degC);

#endif
