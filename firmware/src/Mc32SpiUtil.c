// Mc32SpiUtil.C
// Utilitaire  SPI
//
//	Description : 	fonctions SPI CCS like
//	Auteur 		: 	C. HUBER
//      Création	: 	08.04.2014
//      Modifications   :       09.02.2015 CHR

//  LISTE DES MODIFICATIONS :
//      Utilisation des stdint                  09.02.2015 CHR
//      Adaptation à la plib_spi                09.02.2015 CHR
//      maj version compilateur et Harmony      24.05.2016 CHR
//      Correction de la séquence de lecture    25.05.2016 CHR
//      Version KIT     PCB 11020_B
//	Version		:	V1.2
//	Compilateur	:	XC32 V1.40 + Harmony 1.06
//
/*--------------------------------------------------------*/

// #define MARKER_READ 1

//#include "app.h"
#include "Mc32SpiUtil.h"
#include "peripheral\SPI\plib_spi.h"

/**
@brief Ecrit un octet sur SPI1
@details
Cette fonction ecrit un octet sur SPI1 et attend la fin de la transmission.
@param Val Octet a ecrire.
@return Aucun retour.
@pre SPI1 doit etre configure.
@post L'octet est envoye sur SPI1.
*/
void spi_write1( uint8_t Val){
   int SpiBusy; // Variable pour verifier l'etat du SPI
   PLIB_SPI_BufferWrite(SPI_ID_1, Val); // Ecrit la valeur dans le buffer SPI1
   do {
     SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_1) ; // Verifie si SPI1 est occupe
   } while (SpiBusy == 1); // Attend que SPI1 soit libre
}

/**
@brief Ecrit un octet sur SPI2
@details
Cette fonction ecrit un octet sur SPI2 et attend la fin de la transmission.
@param Val Octet a ecrire.
@return Aucun retour.
@pre SPI2 doit etre configure.
@post L'octet est envoye sur SPI2.
*/
void spi_write2( uint8_t Val){
   int SpiBusy; // Variable pour verifier l'etat du SPI
   PLIB_SPI_BufferWrite(SPI_ID_2, Val); // Ecrit la valeur dans le buffer SPI2
   do {
     SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_2) ; // Verifie si SPI2 est occupe
   } while (SpiBusy == 1); // Attend que SPI2 soit libre
}

/**
@brief Lit un octet depuis SPI1
@details
Cette fonction ecrit un octet sur SPI1 et lit l'octet recu apres la transmission.
@param Val Octet a ecrire (dummy ou commande).
@return Octet recu depuis SPI1.
@pre SPI1 doit etre configure.
@post Retourne l'octet recu depuis SPI1.
*/
uint8_t spi_read1( uint8_t Val){
   int SpiBusy;  // Variable pour verifier l'etat du SPI
   uint32_t lu; // Variable pour stocker la valeur recue
   PLIB_SPI_BufferWrite(SPI_ID_1, Val); // Ecrit la valeur dans le buffer SPI1
   do {
        SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_1) ; // Verifie si SPI1 est occupe
   } while (SpiBusy == 1); // Attend que SPI1 soit libre
   while (PLIB_SPI_ReceiverFIFOIsEmpty(SPI_ID_1)); // Attend la donnee dans la FIFO
   lu = PLIB_SPI_BufferRead(SPI_ID_1); // Lit la valeur recue
   return lu; // Retourne la valeur recue
}

/**
@brief Lit un octet depuis SPI2
@details
Cette fonction ecrit un octet sur SPI2 et lit l'octet recu apres la transmission.
@param Val Octet a ecrire (dummy ou commande).
@return Octet recu depuis SPI2.
@pre SPI2 doit etre configure.
@post Retourne l'octet recu depuis SPI2.
*/
uint8_t spi_read2( uint8_t Val){
   int SpiBusy; // Variable pour verifier l'etat du SPI
   uint8_t lu; // Variable pour stocker la valeur recue
   PLIB_SPI_BufferWrite(SPI_ID_2, Val); // Ecrit la valeur dans le buffer SPI2
   do {
      SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_2) ; // Verifie si SPI2 est occupe
   } while (SpiBusy == 1); // Attend que SPI2 soit libre
   while (PLIB_SPI_ReceiverFIFOIsEmpty(SPI_ID_2)); // Attend la donnee dans la FIFO
   lu = PLIB_SPI_BufferRead(SPI_ID_2); // Lit la valeur recue
   return lu; // Retourne la valeur recue
}



