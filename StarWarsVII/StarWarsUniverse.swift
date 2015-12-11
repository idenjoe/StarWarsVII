//
//  StarWarsUniverse.swift
//  StarWarsVII
//
//  Created by José Manuel Rodríguez Moreno on 09/12/15.
//  Copyright © 2015 José Manuel Rodríguez Moreno. All rights reserved.
//

import UIKit

// Carta a los Reyes Magos:

class StarWarsUniverse {
    
    //MARK: - Private
    // Guardo los personajes en un diccionario cuyas claves son las afiliaciones
    // y los valores son arrays de StarWarsCharacters
    private var characters : [StarWarsAffiliation:[StarWarsCharacter]]
    
    //MARK: - Initialization
    init(arrayOfCharacters : [StarWarsCharacter])
    {
        // Inicializamos el diccionario vacío
        characters = Dictionary<StarWarsAffiliation,Array<StarWarsCharacter>>()
        for each in StarWarsAffiliation.cases() {
            characters[each] = Array<StarWarsCharacter>()
        }
        // Patearse los personajes y según su afiliación los metemos
        // en un sitio y otro
        for character in arrayOfCharacters{
            // Según la afiliación lo metemos en un sitio u otro
            let aff = character.affiliation
            
            characters[aff]?.append(character)
        }
    }
    
    //MARK: - Public
    var countCharacters : Int{
        
        // Total de personajes
        get{
            // Patearse el diccionario e ir sumando la cantidad de personajes de cada afiliación
            var total = 0
            for affiliation in StarWarsAffiliation.cases(){
                total += countCharacters(affiliation)
            }
            
            return total
        }
    }
    
    var countAffiliations: Int{
        // Total de las afiliaciones
        get{
            return StarWarsAffiliation.countAffiliations()
        }
    }
    
    // Total de personajes para cada afiliación
    func countCharacters(inAffiliation: StarWarsAffiliation) -> Int{
        // Obtengo el array de la afiliación y le pregunto cual es su tamaño
        if let chars = characters[inAffiliation] {
            return chars.count
        }
        
        return 0
    }
    
    // El nombre de una afiliación
    func affiliationName(atIndex: Int) -> String{
        // todo
        let affiliations = Array(characters.keys)
        let aff = affiliations[atIndex]
        return StarWarsAffiliation.nameOfAffiliation(aff)
    }
    
    // El personaje n de la afiliación m
    subscript(idx: Int, inAffiliation aff: StarWarsAffiliation) -> StarWarsCharacter?{
        get{
            // Obtener el array de la afiliación
            // el personaje en la posición
            // Deberes
            if let chars = characters[aff]{
                return chars[idx]
            }
            
            return nil
        }
    }
    
}