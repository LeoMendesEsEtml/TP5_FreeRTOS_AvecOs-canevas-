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
#include "apptemp.h"
#include "queue.h"

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
//QueueHandle_t queueTx;
extern QueueHandle_t queueTx;





/* ??? Messages communs (ISR <-> tâches) ??? */
typedef enum { 
    MSG_TEMP = 1, 
    MSG_UARTRX = 2 
} msg_type_t;
#define MSG_PAYLOAD_LEN 16U
typedef struct {
    msg_type_t type;
    char       txt[MSG_PAYLOAD_LEN];
} app_msg_t;
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

void APPLCD_Initialize(void) {
    /* Place the App state machine in its initial state. */
    applcdData.state = APPLCD_STATE_INIT;


}

/******************************************************************************
  Function:
    void APPLCD_Tasks ( void )

  Remarks:
    See prototype in applcd.h.
 */

void APPLCD_Tasks(void) {
    //char recvMsg[7];
    app_msg_t recvMsg;
    /* Check the application's current state. */
    switch (applcdData.state) {
            /* Application's initial state. */
        case APPLCD_STATE_INIT:
        {
            //init LCD + affichage message
            lcd_init();
            lcd_bl_on();
            lcd_gotoxy(1, 1);
            printf_lcd("EMSY3 TP5 FreeRTOS");
            lcd_gotoxy(1, 2);
            printf_lcd("THEBIGSHOW147/Fixohd");


            // ... A COMPLETER ICI...

            applcdData.state = APPLCD_STATE_SERVICE_TASKS;

            break;
        }

        case APPLCD_STATE_SERVICE_TASKS:
        {
            BSP_LEDOff(BSP_LED_2); //debug
            
//            if (xQueueReceive(queueTx, &recvMsg, portMAX_DELAY)) {
//                lcd_gotoxy(1, 3);
//                //printf_lcd("t: ");
//                printf_lcd("Temp: %s°C", recvMsg);
//                //printf_lcd("%s", appData.newTemp);
//            }
            
            if (xQueueReceive(queueTx, &recvMsg, portMAX_DELAY)) {
                switch (recvMsg.type) {
                    case MSG_TEMP:
                        lcd_gotoxy(1, 3);
                        printf_lcd("Temp: %s%cC  ", recvMsg.txt, 176); /* 223 = ° */
                        break;

                    case MSG_UARTRX:
                        lcd_gotoxy(1, 4);
                        printf_lcd("Rx: %-16s", recvMsg.txt);
                        break;
                }
            }

            // ... A COMPLETER ICI...



            BSP_LEDOn(BSP_LED_2); //debug

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
