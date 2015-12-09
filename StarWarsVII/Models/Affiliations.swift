//
//  Affiliations.swift
//  StarWarsVII
//
//  Created by José Manuel Rodríguez Moreno on 19/11/15.
//  Copyright © 2015 José Manuel Rodríguez Moreno. All rights reserved.
//

import Foundation

enum StarWarsAffiliation{
    case GalacticEmpire
    case RebelAlliance
    case JabbaCriminalEmpire
    case FirstOrder
    case Unknown
    
    
    static func byName(name: String) -> StarWarsAffiliation{
        let aff : StarWarsAffiliation
        
        switch name{
        case "Galactic Empire" : aff = .GalacticEmpire
        case "Rebel Alliance" : aff = .RebelAlliance
        case "Jabba's Criminal Empire" : aff = .JabbaCriminalEmpire
        case "First Order" : aff = .FirstOrder
        default : aff = .Unknown
        }
        
        return aff
    }
}