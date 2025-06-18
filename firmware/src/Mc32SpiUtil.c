/*
 * @file Mc32SpiUtil.c
 * @brief Fonctions utilitaires pour la gestion du bus SPI
 *
 * @details
 * Ce fichier contient des fonctions utilitaires pour configurer, envoyer et recevoir
 * des donnees sur le bus SPI Il est utilise par les modules capteurs et autres peripheriques SPI
 *
 * @pre Le SPI doit etre initialise avant utilisation
 * @post Permet la communication SPI fiable avec les peripheriques
 */

/*--------------------------------------------------------*/

// #define MARKER_READ 1

//#include "app.h"
#include "Mc32SpiUtil.h"
#include "peripheral\SPI\plib_spi.h"


// fonction pour ecrire une donnee sur le bus spi 1
void spi_write1( uint8_t Val){ // ecrit la valeur sur le bus spi 1
   int SpiBusy; // variable pour verifier si le spi est occupe
   PLIB_SPI_BufferWrite(SPI_ID_1, Val); // ecrit la donnee dans le buffer spi
   do { // boucle pour attendre la fin de la transmission
     SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_1) ; // verifie si le spi est occupe
   } while (SpiBusy == 1); // continue tant que le spi est occupe
}

// fonction pour ecrire une donnee sur le bus spi 2
void spi_write2( uint8_t Val){ // ecrit la valeur sur le bus spi 2
   int SpiBusy; // variable pour verifier si le spi est occupe
   PLIB_SPI_BufferWrite(SPI_ID_2, Val); // ecrit la donnee dans le buffer spi
   do { // boucle pour attendre la fin de la transmission
     SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_2) ; // verifie si le spi est occupe
   } while (SpiBusy == 1); // continue tant que le spi est occupe
}

// fonction pour lire une donnee sur le bus spi 1
uint8_t spi_read1( uint8_t Val){ // lit une donnee sur le bus spi 1
   int SpiBusy;  // variable pour verifier si le spi est occupe
   uint32_t lu; // variable pour stocker la donnee lue
   PLIB_SPI_BufferWrite(SPI_ID_1, Val); // ecrit la donnee dans le buffer spi
   do { // boucle pour attendre la fin de la transmission
        SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_1) ; // verifie si le spi est occupe
   } while (SpiBusy == 1); // continue tant que le spi est occupe
   while (PLIB_SPI_ReceiverFIFOIsEmpty(SPI_ID_1)); // attend que la donnee arrive dans la fifo
#ifdef MARKER_READ
   LED3_W  = 1; // allume la led pour marquer la lecture
#endif
   lu = PLIB_SPI_BufferRead(SPI_ID_1); // lit la donnee du buffer spi
#ifdef MARKER_READ
   LED3_W  = 0; // eteint la led apres la lecture
#endif
   return lu; // retourne la donnee lue
}

// fonction pour lire une donnee sur le bus spi 2
uint8_t spi_read2( uint8_t Val){ // lit une donnee sur le bus spi 2
   int SpiBusy; // variable pour verifier si le spi est occupe
   uint8_t lu; // variable pour stocker la donnee lue
   PLIB_SPI_BufferWrite(SPI_ID_2, Val); // ecrit la donnee dans le buffer spi
   do { // boucle pour attendre la fin de la transmission
      SpiBusy =  PLIB_SPI_IsBusy(SPI_ID_2) ; // verifie si le spi est occupe
   } while (SpiBusy == 1); // continue tant que le spi est occupe
   while (PLIB_SPI_ReceiverFIFOIsEmpty(SPI_ID_2)); // attend que la donnee arrive dans la fifo
   lu = PLIB_SPI_BufferRead(SPI_ID_2); // lit la donnee du buffer spi
   return lu; // retourne la donnee lue
}



