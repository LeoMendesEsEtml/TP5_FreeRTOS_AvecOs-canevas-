/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    applcd.c

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
// Inclusion du header principal du module LCD
#include "applcd.h" // Fonctions et types du module LCD
// Inclusion du driver LCD
#include "Mc32DriverLcd.h" // Fonctions d'affichage LCD
// Inclusion du module temperature (pour coherence inter-tache)
#include "apptemp.h" // Types partages temperature
// Inclusion de FreeRTOS queue
#include "queue.h" // Gestion des files d'attente FreeRTOS

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
// Declaration de la structure de donnees globale du module LCD
APPLCD_DATA applcdData; // Donnees du module LCD
// Declaration externe de la queue partagee
extern QueueHandle_t queueTx; // File d'attente partagee pour messages

/* essages communs (ISR <-> tâches) */
// Definition du type enumere pour les messages inter-tache
typedef enum { 
    MSG_TEMP = 1, // Message de temperature
    MSG_UARTRX = 2 // Message de reception UART
} msg_type_t;
// Definition de la taille maximale du champ texte dans un message
#define MSG_PAYLOAD_LEN 16U // Taille du champ texte
// Structure de message pour la communication inter-tache
typedef struct {
    msg_type_t type; // Type de message
    char       txt[MSG_PAYLOAD_LEN]; // Donnees du message
} app_msg_t;

/**
@brief Initialise le module LCD
@details
Cette fonction place la machine d'etat du module LCD dans son etat initial.
@param Aucun parametre.
@return Aucun retour.
@pre Doit etre appelee avant toute utilisation des fonctions de ce module.
@post Le module LCD est pret a fonctionner.
*/
void APPLCD_Initialize(void) {
    applcdData.state = APPLCD_STATE_INIT; // Met l'etat initial
}

/**
@brief Tache principale de gestion de l'affichage LCD
@details
Cette fonction implemente la machine d'etat et la logique principale du module LCD. Elle gere l'initialisation, la reception des messages et l'affichage sur l'ecran LCD.
@param Aucun parametre.
@return Aucun retour.
@pre Le systeme et le module LCD doivent etre initialises avant d'appeler cette fonction.
@post Les messages sont affiches sur le LCD a chaque reception.
*/
void APPLCD_Tasks(void) {
    app_msg_t recvMsg; // Structure pour recevoir les messages
    switch (applcdData.state) { // Teste l'etat courant
        case APPLCD_STATE_INIT:
        {
            lcd_init(); // Initialise le LCD
            lcd_bl_on(); // Allume le retroeclairage
            lcd_gotoxy(1, 1); // Place le curseur ligne 1
            printf_lcd("EMSY3 TP5 FreeRTOS"); // Affiche le titre
            lcd_gotoxy(1, 2); // Place le curseur ligne 2
            printf_lcd("THEBIGSHOW147/Fixohd"); // Affiche les noms
            applcdData.state = APPLCD_STATE_SERVICE_TASKS; // Passe a l'etat service
            break;
        }
        case APPLCD_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_2); // Eteint la LED debug
            if (xQueueReceive(queueTx, &recvMsg, portMAX_DELAY)) { // Attend un message dans la queue
                switch (recvMsg.type) { // Teste le type de message
                    case MSG_TEMP:
                        lcd_gotoxy(1, 3); // Place le curseur ligne 3
                        printf_lcd("Temp: %s%cC  ", recvMsg.txt, 176); // Affiche la temperature
                        break;
                    case MSG_UARTRX:
                        lcd_gotoxy(1, 4); // Place le curseur ligne 4
                        printf_lcd("Rx: %-16s", recvMsg.txt); // Affiche la reception UART
                        break;
                }
            }
            BSP_LEDOn(BSP_LED_2); // Allume la LED debug
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
