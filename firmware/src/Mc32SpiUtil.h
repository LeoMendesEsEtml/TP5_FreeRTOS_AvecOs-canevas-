/**
@file Mc32SpiUtil.h
@brief Interface des utilitaires SPI
@details
Ce fichier contient les declarations et prototypes publics pour les fonctions utilitaires SPI.
*/
#ifndef Mc32SpiUtil_H
#define Mc32SpiUtil_H

#include <stdint.h> // Types entiers standard

/**
@brief Ecrit un octet sur SPI1
@param Val Octet a ecrire.
@return Aucun retour.
*/
void spi_write1( uint8_t Val);

/**
@brief Ecrit un octet sur SPI2
@param Val Octet a ecrire.
@return Aucun retour.
*/
void spi_write2( uint8_t Val);

/**
@brief Lit un octet depuis SPI1
@param Val Octet a ecrire (dummy ou commande).
@return Octet recu depuis SPI1.
*/
uint8_t spi_read1( uint8_t Val);

/**
@brief Lit un octet depuis SPI2
@param Val Octet a ecrire (dummy ou commande).
@return Octet recu depuis SPI2.
*/
uint8_t spi_read2( uint8_t Val);

#endif
