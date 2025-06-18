/**
@file applcd.h
@brief Interface du module LCD
@details
Ce fichier contient les declarations, types et prototypes publics pour le module LCD.
*/
#ifndef _APPLCD_H
#define _APPLCD_H

#include <stdint.h> // Types entiers standard
#include <stdbool.h> // Types booleens standard
#include <stddef.h> // Types de taille standard
#include <stdlib.h> // Fonctions utilitaires standard
#include "system_config.h" // Configuration systeme
#include "system_definitions.h" // Definitions systeme

#ifdef __cplusplus
extern "C" {
#endif

/**
@brief Etats de la machine d'etat du module LCD
*/
typedef enum {
    APPLCD_STATE_INIT=0, // Etat initial
    APPLCD_STATE_SERVICE_TASKS // Etat de service
} APPLCD_STATES;

/**
@brief Structure de donnees du module LCD
*/
typedef struct {
    APPLCD_STATES state; // Etat courant de la machine d'etat
} APPLCD_DATA;

/**
@brief Initialise le module LCD
@details
Place la machine d'etat du module LCD dans son etat initial.
@param Aucun parametre.
@return Aucun retour.
*/
void APPLCD_Initialize(void);

/**
@brief Tache principale du module LCD
@details
Implemente la machine d'etat et la logique principale du module LCD.
@param Aucun parametre.
@return Aucun retour.
*/
void APPLCD_Tasks(void);

#ifdef __cplusplus
}
#endif

#endif

