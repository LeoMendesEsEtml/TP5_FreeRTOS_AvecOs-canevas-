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
#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"

extern APPTEMP_DATA apptempData;    // déjà déclaré dans apptemp.c

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector Functions
// *****************************************************************************
// *****************************************************************************
void IntHandlerDrvUsartInstance0(void)
{
    DRV_USART_TasksTransmit(sysObj.drvUsart0);
    DRV_USART_TasksError(sysObj.drvUsart0);
    DRV_USART_TasksReceive(sysObj.drvUsart0);
    BaseType_t xHPTaskWoken = pdFALSE;

    while (!DRV_USART_ReceiverBufferIsEmpty(sysObj.drvUsart0)) {
        char c = DRV_USART_ReadByte(sysObj.drvUsart0);

        APP_MESSAGE msg = {.type = MSG_UART_CHAR};
        msg.data.c = c;

        xQueueSendFromISR(apptempData.xQueue, &msg, &xHPTaskWoken);
    }
    portEND_SWITCHING_ISR(xHPTaskWoken);
}
/* === Timer 2 : instance 0  ============================================= */
void IntHandlerDrvTmrInstance0(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    /* 1) ton code applicatif  ------------------------------------------ */
    xSemaphoreGiveFromISR(apptempData.xTempSem, &xHigherPriorityTaskWoken);

    /* (optionnel) témoin visuel */
    BSP_LEDToggle(BSP_LED_3);

    /* 2) Clear du flag matériel  --------------------------------------- */
    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_TIMER_2);

    /* 3) éventuel changement de contexte ------------------------------- */
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

/* === Timer 3 : instance 1  ============================================= */
void IntHandlerDrvTmrInstance1(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    /* Action spécifique à ce timer (si besoin) */
    xSemaphoreGiveFromISR(apptempData.xTempSem, &xHigherPriorityTaskWoken);

    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_TIMER_3);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

 /*******************************************************************************
 End of File
*/
