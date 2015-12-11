//
//  JSONProcessing.swift
//  StarWarsVII
//
//  Created by José Manuel Rodríguez Moreno on 08/12/15.
//  Copyright © 2015 José Manuel Rodríguez Moreno. All rights reserved.
//

import UIKit

//{
//    "firstName"    : null,
//    "lastName"     : null,
//    "alias"        : "C-3PO",
//    "soundFile"    : "c3po.caf",
//    "imageFile"    : "c3po.jpg",
//    "affiliation"  : "Rebel Alliance",
//    "url"          : "https://en.wikipedia.org/wiki/C-3PO",
//}

//MARK: - Aliases
typealias JSONObject        = AnyObject
typealias JSONDictionary    = [String:JSONObject]
typealias JSONArray         = [JSONDictionary]

//MARK: - Errors

enum JSONProcessingError : ErrorType{
    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat
}

struct StrictStarWarsCharacter {
    
    let firstName   :   String?
    let lastName    :   String?
    let alias       :   String?
    let photo       :   UIImage
    let url         :   NSURL
    let affiliation :   StarWarsAffiliation
    let soundData   :   NSData
}

struct StrictForceSensitive {
    let character   :   StrictStarWarsCharacter
    let midichlorians   :   Int
}

//MARK: Decoding
func decode(starWarsCharacter json: JSONDictionary) throws -> StrictStarWarsCharacter{
    guard let urlString = json["url"] as? String,
        url = NSURL(string: urlString) else{
            throw JSONProcessingError.WrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String,
        image = UIImage(named: imageName) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String,
        soundUrl = NSBundle.mainBundle().URLForResource(soundName),
        soundData = NSData(contentsOfURL: soundUrl) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }
    
    guard let affiliationString = json["affiliation"] as? String else{
        throw JSONProcessingError.WrongJSONFormat
    }
    
    // Estamos en el mundo de yupi: Todo está bien
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String
    let affiliation = StarWarsAffiliation.byName(affiliationString)
    
    return StrictStarWarsCharacter(firstName: firstName,
        lastName: lastName,
        alias: alias,
        photo: image,
        url: url,
        affiliation: affiliation,
        soundData: soundData)
    
}

func decode(forceSensitive json: JSONDictionary) throws -> StrictForceSensitive{
    
    // es requisito imprescindible tener los midichlorianos bien puestos
    // para entrar al club
    
    guard let md = json["midichlorians"] as? Int else{
        throw JSONProcessingError.WrongJSONFormat
    }
    
    return StrictForceSensitive(character: try decode(starWarsCharacter: json),
        midichlorians: md)
}


//MARK: - Initialization

extension StarWarsCharacter{
    // Un init que acepta los parámetros empaquetados en un StrictStarWarsCharacters
    
    convenience init(strictStarWarsCharacter c: StrictStarWarsCharacter){
        
        self.init(firstName: c.firstName,
            lastName : c.lastName,
            alias : c.alias,
            soundData: c.soundData,
            photo: c.photo,
            url: c.url,
            affiliation: c.affiliation)
    }
}