/**
@file apptemp.h
@brief Interface du module temperature
@details
Ce fichier contient les declarations, types et prototypes publics pour le module temperature.
*/
#ifndef _APPTEMP_H
#define _APPTEMP_H

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
@brief Etats de la machine d'etat du module temperature
*/
typedef enum {
    APPTEMP_STATE_INIT=0, // Etat initial
    APPTEMP_STATE_SERVICE_TASKS // Etat de service
} APPTEMP_STATES;

/**
@brief Structure de donnees du module temperature
*/
typedef struct {
    APPTEMP_STATES state; // Etat courant de la machine d'etat
} APPTEMP_DATA;

/**
@brief Initialise le module temperature
@details
Place la machine d'etat du module temperature dans son etat initial.
@param Aucun parametre.
@return Aucun retour.
*/
void APPTEMP_Initialize(void);

/**
@brief Tache principale du module temperature
@details
Implemente la machine d'etat et la logique principale du module temperature.
@param Aucun parametre.
@return Aucun retour.
*/
void APPTEMP_Tasks(void);

#ifdef __cplusplus
}
#endif

#endif

