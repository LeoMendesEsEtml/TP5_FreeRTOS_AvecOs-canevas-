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

#include "applcd.h"
#include "Mc32DriverLcd.h"
#include "FreeRTOS.h"
#include "queue.h"
#include "apptemp.h"       // pour gAppQueue & APP_MESSAGE

extern QueueHandle_t gAppQueue;


// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
 */

APPLCD_DATA applcdData;


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
    void APPLCD_Initialize ( void )

  Remarks:
    See prototype in applcd.h.
 */

/**
 * @brief Initialise le module LCD
 *
 * @details
 * Cette fonction place la machine d'etat du module LCD dans son etat initial.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Doit etre appelee avant toute utilisation des fonctions de ce module.
 * @post Le module LCD est pret a fonctionner.
 */
void APPLCD_Initialize(void) {
    applcdData.state = APPLCD_STATE_INIT; // met l'etat initial
}

/******************************************************************************
  Function:
    void APPLCD_Tasks ( void )

  Remarks:
    See prototype in applcd.h.
 */

/**
 * @brief Tache principale de gestion de l'affichage LCD
 *
 * @details
 * Cette fonction implemente la machine d'etat et la logique principale du module LCD. Elle gere l'initialisation, la reception des messages et l'affichage sur l'ecran LCD.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Le systeme et le module LCD doivent etre initialises avant d'appeler cette fonction.
 * @post Les messages sont affiches sur le LCD a chaque reception.
 */
void APPLCD_Tasks(void) {
    /* Check the application's current state. */
    switch (applcdData.state) {
        case APPLCD_STATE_INIT:
        {
            lcd_init();
            lcd_bl_on();
            lcd_clear();
            lcd_gotoxy(1, 1);
            printf_lcd("EMSY3 TP5 FreeRTOS");
            lcd_gotoxy(1, 2);
            printf_lcd("Leo Mendes");
            lcd_gotoxy(1, 3);
            printf_lcd("Mattieu Bucher");
            applcdData.state = APPLCD_STATE_SERVICE_TASKS;
            break;
        }
        case APPLCD_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_2);
            while (1) {
                APP_MESSAGE msg;
                if (xQueueReceive(gAppQueue, &msg, portMAX_DELAY) == pdTRUE) {
                    if (msg.type == MSG_TEMP) {
                        lcd_gotoxy(1, 3);
                        printf_lcd("Temp: %5.2f C", msg.data.f);
                    } else if (msg.type == MSG_UART_CHAR) {
                        lcd_gotoxy(1, 4);
                        lcd_putc(msg.data.c);
                    }
                }
            }
            BSP_LEDOn(BSP_LED_2);
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

/**
 * @file applcd.c
 * @brief Module de gestion de l'affichage LCD avec FreeRTOS
 *
 * @details
 * Ce fichier gere l'affichage des messages recus via la queue, le decodage des messages,
 * et la mise a jour de l'affichage LCD Il utilise les mecanismes de FreeRTOS pour la synchronisation
 *
 * @pre Le systeme doit etre initialise avant d'utiliser ces fonctions
 * @post Les messages sont affiches sur le LCD a chaque reception
 */
