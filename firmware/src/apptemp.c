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

#include "apptemp.h"
#include "Mc32gestSpiLM70.h"
#include "semphr.h"
#include "queue.h"
#include <stdio.h>


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

APPTEMP_DATA apptempData;
SemaphoreHandle_t semIntTimer;
extern QueueHandle_t queueTx;



/* ??? Messages communs (ISR <-> tâches) ??? */
typedef enum { MSG_TEMP = 1, MSG_UARTRX = 2 } msg_type_t;
#define MSG_PAYLOAD_LEN 16U
typedef struct {
    msg_type_t type;
    char       txt[MSG_PAYLOAD_LEN];
} app_msg_t;


QueueHandle_t queueTx = NULL;
SemaphoreHandle_t semIntTimer = NULL; 
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

void APPTEMP_Initialize(void) {
    /* Place the App state machine in its initial state. */
    apptempData.state = APPTEMP_STATE_INIT;

}

/******************************************************************************
  Function:
    void APPTEMP_Tasks ( void )

  Remarks:
    See prototype in apptemp.h.
 */

void APPTEMP_Tasks(void) {
//    int16_t iTemp;
//    float fTemp;
//    char msg[7];
    int16_t  iTemp;
    float    fTemp;
    app_msg_t m;

    /* Check the application's current state. */
    switch (apptempData.state) {
            /* Application's initial state. */
        case APPTEMP_STATE_INIT:
        {
            DRV_TMR0_Start();
            SPI_InitLM70();
            semIntTimer = xSemaphoreCreateBinary();
            // Initialisation
            queueTx = xQueueCreate(16, sizeof(app_msg_t));


            apptempData.state = APPTEMP_STATE_SERVICE_TASKS;

            break;
        }

        case APPTEMP_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_1); //debug           

            //attente semaphore (portMAX_DELAY = indéfiniment)
            if (xSemaphoreTake(semIntTimer, portMAX_DELAY)) {
                // lecture température 
                iTemp = SPI_ReadRawTempLM70();
                LM70_ConvRawToDeg(iTemp, &fTemp);
                // Multiplier par 100 pour capturer deux décimales
                int tempInt = (int) (fTemp * 100);
                // Séparer la partie entière et la partie décimale
                int ent = tempInt / 100;
                int dec = abs(tempInt % 100); // Toujours positif
//                sprintf(msg, "%+d.%02d", ent, dec);
                
                
                m.type = MSG_TEMP;
                snprintf(m.txt, sizeof m.txt, "%+d.%02d", ent, dec);
                //Placement d'un élément dans la queue
                xQueueSend(queueTx, &m, 0U);
            }



            BSP_LEDOn(BSP_LED_1); //debug

            break;
        }

            /* TODO: implement your application state machine.*/


            /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}



/*******************************************************************************
 End of File
 */
