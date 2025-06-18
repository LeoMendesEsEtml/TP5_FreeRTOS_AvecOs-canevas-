#ifndef Mc32SpiUtil_H
#define Mc32SpiUtil_H
/*--------------------------------------------------------*/
// Mc32SpiUtil.h
/*--------------------------------------------------------*/
//	Description :	Utilitaire gestion SPI CCS like
//
//	Auteur 		: 	C. Huber
//	Version		:	V1.1
//	Compilateur	:	XC32 V1.40
//
/*--------------------------------------------------------*/



#include <stdint.h>

/**
 * @file Mc32SpiUtil.h
 * @brief Declarations pour les fonctions utilitaires SPI
 *
 * @details
 * Ce fichier contient les prototypes et definitions pour la gestion utilitaire du bus SPI
 *
 * @pre Le SPI doit etre initialise avant utilisation
 * @post Permet la configuration et l'utilisation du bus SPI dans l'application
 */

/**
 * @brief Ecrit un octet sur le bus SPI 1
 *
 * @details
 * Cette fonction ecrit un octet sur le bus SPI 1 en utilisant la methode 1. Elle attend la fin de la transmission avant de rendre la main.
 *
 * @param Val octet a envoyer sur le bus SPI.
 * @return Aucun retour.
 *
 * @pre Le SPI doit etre initialise avant d'appeler cette fonction.
 * @post L'octet est transmis sur le bus SPI 1.
 */
void spi_write1(uint8_t Val);

/**
 * @brief Ecrit un octet sur le bus SPI 2
 *
 * @details
 * Cette fonction ecrit un octet sur le bus SPI 2 en utilisant la methode 2. Elle attend la fin de la transmission avant de rendre la main.
 *
 * @param Val octet a envoyer sur le bus SPI.
 * @return Aucun retour.
 *
 * @pre Le SPI doit etre initialise avant d'appeler cette fonction.
 * @post L'octet est transmis sur le bus SPI 2.
 */
void spi_write2(uint8_t Val);

/**
 * @brief Lit un octet du bus SPI 1
 *
 * @details
 * Cette fonction lit un octet du bus SPI 1 en envoyant une valeur et en attendant la reponse. Elle retourne l'octet recu.
 *
 * @param Val octet a envoyer pour initier la lecture.
 * @return uint8_t octet recu du bus SPI.
 *
 * @pre Le SPI doit etre initialise avant d'appeler cette fonction.
 * @post Retourne la valeur lue sur le bus SPI 1.
 */
uint8_t spi_read1(uint8_t Val);

/**
 * @brief Lit un octet du bus SPI 2
 *
 * @details
 * Cette fonction lit un octet du bus SPI 2 en envoyant une valeur et en attendant la reponse. Elle retourne l'octet recu.
 *
 * @param Val octet a envoyer pour initier la lecture.
 * @return uint8_t octet recu du bus SPI.
 *
 * @pre Le SPI doit etre initialise avant d'appeler cette fonction.
 * @post Retourne la valeur lue sur le bus SPI 2.
 */
uint8_t spi_read2(uint8_t Val);

#endif
