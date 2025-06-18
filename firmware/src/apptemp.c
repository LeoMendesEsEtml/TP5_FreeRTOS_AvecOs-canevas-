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


/**
 * @file apptemp.c
 * @brief Module de gestion de la temperature avec FreeRTOS
 *
 * @details
 * Ce fichier contient l'implementation de la tache de lecture de temperature,
 * la synchronisation via semaphore, et l'envoi des donnees dans une queue
 * Il gere aussi l'initialisation des objets FreeRTOS et la communication SPI avec le LM70
 *
 * @pre Le systeme doit etre initialise avant d'utiliser ces fonctions
 * @post Les donnees de temperature sont envoyees periodiquement dans la queue
 */

// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"

#include "apptemp.h"
#include "Mc32gestSpiLM70.h"
#include <stdio.h>

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

/**
 * @brief Donnees de l'application pour la gestion de la temperature.
 *
 * @details
 * Structure globale contenant l'etat et les objets FreeRTOS necessaires.
 */
APPTEMP_DATA apptempData;
QueueHandle_t gAppQueue = NULL;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APPTEMP_Initialize ( void )

  Remarks:
    See prototype in apptemp.h.
 */

/**
 * @brief Initialise le module temperature
 *
 * @details
 * Cette fonction cree le semaphore et la queue FreeRTOS, initialise l'etat de l'application et demarre les timers necessaires.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Doit etre appelee avant toute utilisation des fonctions de ce module.
 * @post Les objets FreeRTOS sont prets et les timers sont demarres.
 */
void APPTEMP_Initialize (void)
{
    apptempData.state = APPTEMP_STATE_INIT; // met l'etat initial

    /* --- objets FreeRTOS --- */
    apptempData.xTempSem = xSemaphoreCreateBinary(); // cree le semaphore binaire
    apptempData.xQueue   = xQueueCreate(APP_QUEUE_LENGTH, sizeof(APP_MESSAGE)); // cree la queue

    configASSERT(apptempData.xTempSem && apptempData.xQueue); // verifie la creation

    /* rendre la queue visible aux autres modules */
    gAppQueue = apptempData.xQueue; // partage la queue globalement

    /* on démarre vide */
    xSemaphoreTake(apptempData.xTempSem, 0); // prend le semaphore pour demarrer a zero
    DRV_TMR0_Start(); // demarre le timer 0
    DRV_TMR1_Start(); // demarre le timer 1
}



/******************************************************************************
  Function:
    void APPTEMP_Tasks ( void )

  Remarks:
    See prototype in apptemp.h.
 */

/**
 * @brief Tache FreeRTOS de gestion de la temperature
 *
 * @details
 * Cette fonction attend le semaphore libere par l'interruption timer, lit la temperature via SPI, formate un message et l'envoie dans la queue. Elle boucle indefiniment dans l'etat de service.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre APPTEMP_Initialize doit avoir ete appelee.
 * @post Les messages de temperature sont envoyes dans la queue a chaque periode.
 */
void APPTEMP_Tasks ( void )
{
    // Vérification de l'état courant de l'application
    switch ( apptempData.state )
    {
        case APPTEMP_STATE_INIT:
        {
            SPI_InitLM70();   // initialise le capteur LM70
            apptempData.state = APPTEMP_STATE_SERVICE_TASKS; // passe a l'etat service
            break;
        }
        case APPTEMP_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_1); // eteint la led 1
            while (1) {
                // 1- Attente du semaphore (libere par le timer)
                if (xSemaphoreTake(apptempData.xTempSem, portMAX_DELAY) == pdTRUE) {
                    // 2- Lecture du LM70
                    int16_t raw = SPI_ReadRawTempLM70(); // lit la temperature brute
                    float degC;
                    LM70_ConvRawToDeg(raw, &degC); // convertit en degres Celsius
                    // 3- Encapsulation & 4- envoi dans la queue
                    APP_MESSAGE msg = {.type = MSG_TEMP}; // prepare le message
                    msg.data.f = degC; // stocke la temperature
                    xQueueSend(gAppQueue, &msg, 0); // envoie dans la queue globale
                }
            }
            BSP_LEDOn(BSP_LED_1); // allume la led 1 (jamais atteint)
            break;
        }
        default:
        {
            // gestion d'erreur d'etat inattendu
            break;
        }
    }
}
// *****************************************************************************
// *****************************************************************************
// End of File
// *****************************************************************************