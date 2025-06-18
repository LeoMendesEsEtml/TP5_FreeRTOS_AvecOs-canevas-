/*******************************************************************************
 System Interrupts File

  File Name:
    system_interrupt.c

  Summary:
    Raw ISR definitions.

  Description:
    This file contains a definitions of the raw ISRs required to support the
    interrupt sub-system.

  Summary:
    This file contains source code for the interrupt vector functions in the
    system.

  Description:
    This file contains source code for the interrupt vector functions in the
    system.  It implements the system and part specific vector "stub" functions
    from which the individual "Tasks" functions are called for any modules
    executing interrupt-driven in the MPLAB Harmony system.

  Remarks:
    This file requires access to the systemObjects global data structure that
    contains the object handles to all MPLAB Harmony module objects executing
    interrupt-driven in the system.  These handles are passed into the individual
    module "Tasks" functions to identify the instance of the module to maintain.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2011-2014 released Microchip Technology Inc.  All rights reserved.

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

#include "system/common/sys_common.h"
#include "apptemp.h"
#include "applcd.h"
#include "system_definitions.h"
#include "queue.h"
#include "semphr.h"
extern QueueHandle_t queueTx;
extern SemaphoreHandle_t semIntTimer;

typedef enum {
    MSG_TEMP = 1,
    MSG_UARTRX = 2
} msg_type_t;

#define MSG_PAYLOAD_LEN 16U

typedef struct {
    msg_type_t type;
    char txt[MSG_PAYLOAD_LEN];
} app_msg_t;

/**
@brief Routine d'interruption USART
@details
Cette fonction gere l'interruption USART, lit les donnees recues et envoie un message a la queue si necessaire.
@param Aucun parametre.
@return Aucun retour.
@pre USART et FreeRTOS doivent etre initialises.
@post Les donnees sont lues et envoyees a la queue si recues.
*/
void IntHandlerDrvUsartInstance0(void)
{
    BaseType_t xNeedSwitch = pdFALSE; // Variable pour changement de contexte
    app_msg_t  m;       m.type = MSG_UARTRX; // Structure message et type

    /* Tâches Harmony (optionnel mais conseillé) */
    DRV_USART_TasksError   (sysObj.drvUsart0); // Gere les erreurs USART
    DRV_USART_TasksReceive (sysObj.drvUsart0); // Gere la reception USART

    /* Lecture FIFO */
    size_t i = 0; // Index pour les donnees recues
    while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1) && i < MSG_PAYLOAD_LEN-1) // Tant que donnees disponibles et place
    {
        m.txt[i++] = PLIB_USART_ReceiverByteReceive(USART_ID_1); // Lit un octet du USART
    }
    m.txt[i] = '\0'; // Termine la chaine

    if (i) // Si des donnees ont ete recues
        xQueueSendFromISR(queueTx, &m, &xNeedSwitch); // Envoie le message a la queue depuis l'ISR

    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE); // Efface le flag d'interruption
    portEND_SWITCHING_ISR(xNeedSwitch); // Termine l'ISR et change de contexte si besoin
}

/**
@brief Routine d'interruption Timer
@details
Cette fonction gere l'interruption du timer et donne un semaphore pour signaler un evenement timer.
@param Aucun parametre.
@return Aucun retour.
@pre Timer et FreeRTOS doivent etre initialises.
@post Le semaphore est donne depuis l'ISR pour signaler l'evenement timer.
*/
void IntHandlerDrvTmrInstance0(void)
{
    BaseType_t xNeedSwitch = pdFALSE; // Variable pour changement de contexte

    xSemaphoreGiveFromISR(semIntTimer, &xNeedSwitch); // Donne le semaphore depuis l'ISR

    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_TIMER_2); // Efface le flag d'interruption
    portEND_SWITCHING_ISR(xNeedSwitch); // Termine l'ISR et change de contexte si besoin
}

/*******************************************************************************
 End of File
*/
