/**
 * @file apptemp.h
 * @brief Declarations pour la gestion de la temperature avec FreeRTOS
 *
 * @details
 * Ce fichier contient les prototypes, types et constantes necessaires a la gestion de la temperature
 * Il definit l'interface publique du module temperature pour l'application FreeRTOS
 *
 * @pre Le module doit etre initialise avant utilisation
 * @post Permet la lecture et l'envoi de la temperature via les fonctions du module
 */

/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    apptemp.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_Initialize" and "APP_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

//DOM-IGNORE-BEGIN
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
//DOM-IGNORE-END

#ifndef _APPTEMP_H
#define _APPTEMP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "system_config.h"
#include "system_definitions.h"
#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END 

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************
#define APP_QUEUE_LENGTH   32

typedef enum { MSG_TEMP, MSG_UART_CHAR } APP_MSG_TYPE;

typedef struct
{
    APP_MSG_TYPE type;
    union {
        float f;      // température en °C
        char  c;      // caractère reçu
    } data;
} APP_MESSAGE;

extern QueueHandle_t gAppQueue;     // utilisable par les autres modules

// *****************************************************************************
/* Application states

  Summary:
    Application states enumeration

  Description:
    This enumeration defines the valid application states.  These states
    determine the behavior of the application at various times.
*/

typedef enum
{
	/* Application's state machine's initial state. */
	APPTEMP_STATE_INIT=0,
	APPTEMP_STATE_SERVICE_TASKS,

	/* TODO: Define states used by the application state machine. */

} APPTEMP_STATES;


// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */

typedef struct
{
    APPTEMP_STATES  state;
    QueueHandle_t   xQueue;
    SemaphoreHandle_t xTempSem;
} APPTEMP_DATA;


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/
	
// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APPTEMP_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the 
    application in its initial state and prepares it to run so that its 
    APP_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APPTEMP_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

/**
 * @brief Initialise le module temperature
 *
 * @details
 * Cette fonction initialise le module temperature, place l'application dans son etat initial et prepare les objets FreeRTOS necessaires.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Toutes les autres initialisations systeme doivent etre faites avant d'appeler cette fonction.
 * @post Le module temperature est pret a fonctionner.
 */
void APPTEMP_Initialize ( void );


/*******************************************************************************
  Function:
    void APPTEMP_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APPTEMP_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

/**
 * @brief Tache principale de gestion de la temperature
 *
 * @details
 * Cette fonction implemente la machine d'etat et la logique principale du module temperature. Elle gere la lecture, la conversion et l'envoi des donnees de temperature.
 *
 * @param Aucun parametre.
 * @return Aucun retour.
 *
 * @pre Le systeme et le module temperature doivent etre initialises avant d'appeler cette fonction.
 * @post Les donnees de temperature sont gerees et envoyees selon la logique de l'application.
 */
void APPTEMP_Tasks( void );


#endif /* _APPTEMP_H */

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

/*******************************************************************************
 End of File
 */

