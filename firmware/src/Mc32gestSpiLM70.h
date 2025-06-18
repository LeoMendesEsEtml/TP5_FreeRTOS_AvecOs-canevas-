/**
@file Mc32gestSpiLM70.h
@brief Interface du module de gestion SPI du capteur LM70
@details
Ce fichier contient les declarations et prototypes publics pour la gestion SPI du capteur de temperature LM70.
*/
#ifndef Mc32GestSpiLM70_H
#define Mc32GestSpiLM70_H

#include <stdint.h> // Types entiers standard

/**
@brief Initialise la communication SPI avec le LM70
@details
Initialise le peripherique SPI pour le capteur LM70.
@param Aucun parametre.
@return Aucun retour.
*/
void SPI_InitLM70(void);

/**
@brief Lit la temperature brute du LM70
@details
Lit la valeur brute de temperature du capteur LM70.
@param Aucun parametre.
@return Valeur brute de temperature (int16_t).
*/
int16_t SPI_ReadRawTempLM70(void);

/**
@brief Lit la temperature brute du LM70 avec reconfiguration
@details
Reconfigure le SPI et lit la valeur brute de temperature du capteur LM70.
@param Aucun parametre.
@return Valeur brute de temperature (int16_t).
*/
int16_t SPI_CfgReadRawTempLM70(void);

/**
@brief Convertit la valeur brute LM70 en degres Celsius
@details
Convertit la valeur brute de temperature du LM70 en degres Celsius.
@param RowTemp Valeur brute.
@param PTemp Pointeur vers float pour le resultat.
@return Aucun retour.
*/
void LM70_ConvRawToDeg( int16_t RowTemp, float *PTemp);

#endif
