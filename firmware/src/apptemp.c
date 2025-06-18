/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    apptemp.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Inclusion du header principal du module temperature
  Fonctions et types du module temperature
 *******************************************************************************/
#include "apptemp.h"

/*******************************************************************************
  Inclusion du module SPI LM70
  Fonctions capteur LM70
 *******************************************************************************/
#include "Mc32gestSpiLM70.h"

/*******************************************************************************
  Inclusion de FreeRTOS semaphore
  Gestion des semaphores FreeRTOS
 *******************************************************************************/
#include "semphr.h"

/*******************************************************************************
  Inclusion de FreeRTOS queue
  Gestion des files d'attente FreeRTOS
 *******************************************************************************/
#include "queue.h"

/*******************************************************************************
  Inclusion des fonctions d'affichage standard
  Fonctions d'entree/sortie standard
 *******************************************************************************/
#include <stdio.h>

// Declaration de la structure de donnees globale du module temperature
APPTEMP_DATA apptempData; // Donnees du module temperature
// Declaration du handle de semaphore global
SemaphoreHandle_t semIntTimer; // Semaphore pour synchronisation timer
// Declaration externe de la queue partagee
extern QueueHandle_t queueTx; // File d'attente partagee pour messages

// Definition du type enumere pour les messages inter-tache
typedef enum { MSG_TEMP = 1, MSG_UARTRX = 2 } msg_type_t; // Types de messages
// Definition de la taille maximale du champ texte dans un message
#define MSG_PAYLOAD_LEN 16U // Taille du champ texte
// Structure de message pour la communication inter-tache
typedef struct {
    msg_type_t type; // Type de message
    char       txt[MSG_PAYLOAD_LEN]; // Donnees du message
} app_msg_t;

// Declaration de la queue globale
QueueHandle_t queueTx = NULL; // File d'attente globale
// Declaration du semaphore global
SemaphoreHandle_t semIntTimer = NULL; // Semaphore global

/**
@brief Initialise le module temperature
@details
Cette fonction place la machine d'etat du module temperature dans son etat initial.
@param Aucun parametre.
@return Aucun retour.
@pre Doit etre appelee avant toute utilisation des fonctions de ce module.
@post Le module temperature est pret a fonctionner.
*/
void APPTEMP_Initialize(void) {
    apptempData.state = APPTEMP_STATE_INIT; // Met l'etat initial
}

/**
@brief Tache principale de gestion de la temperature
@details
Cette fonction implemente la machine d'etat et la logique principale du module temperature. Elle gere l'initialisation, la lecture du capteur et l'envoi des messages.
@param Aucun parametre.
@return Aucun retour.
@pre Le systeme et le module temperature doivent etre initialises avant d'appeler cette fonction.
@post Les messages de temperature sont envoyes a chaque acquisition.
*/
void APPTEMP_Tasks(void) {
    int16_t  iTemp; // Variable pour la temperature brute
    float    fTemp; // Variable pour la temperature convertie
    app_msg_t m; // Structure message
    switch (apptempData.state) { // Teste l'etat courant
        case APPTEMP_STATE_INIT:
        {
            DRV_TMR0_Start(); // Demarre le timer
            SPI_InitLM70(); // Initialise le capteur LM70
            semIntTimer = xSemaphoreCreateBinary(); // Cree le semaphore
            queueTx = xQueueCreate(16, sizeof(app_msg_t)); // Cree la queue
            apptempData.state = APPTEMP_STATE_SERVICE_TASKS; // Passe a l'etat service
            break;
        }
        case APPTEMP_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_1); // Eteint la LED debug
            if (xSemaphoreTake(semIntTimer, portMAX_DELAY)) { // Attend le semaphore
                iTemp = SPI_ReadRawTempLM70(); // Lit la temperature brute
                LM70_ConvRawToDeg(iTemp, &fTemp); // Convertit en degres
                int tempInt = (int) (fTemp * 100); // Multiplie pour garder 2 decimales
                int ent = tempInt / 100; // Partie entiere
                int dec = abs(tempInt % 100); // Partie decimale positive
                m.type = MSG_TEMP; // Type message temperature
                snprintf(m.txt, sizeof m.txt, "%+d.%02d", ent, dec); // Formate la chaine
                xQueueSend(queueTx, &m, 0U); // Envoie le message dans la queue
            }
            BSP_LEDOn(BSP_LED_1); // Allume la LED debug
            break;
        }
        default:
        {
            break;
        }
    }
}

/*******************************************************************************
 End of File
 */
