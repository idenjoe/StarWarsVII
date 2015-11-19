//
//  StarWarsCharacter.swift
//  StarWarsVII
//
//  Created by José Manuel Rodríguez Moreno on 19/11/15.
//  Copyright © 2015 José Manuel Rodríguez Moreno. All rights reserved.
//

import UIKit

class StarWarsCharacter {
    
    //MARK: - Properties    
    let firstName   :   String?
    let lastName  :   String?
    let alias       :   String?
    let photo       :   UIImage
    let url         :   NSURL
    let affiliation :   StarWarsAffiliation
    let soundData   :   NSData
    
    //MARK: - Init
    init(firstName: String?,
        lastName : String?,
        alias : String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation){
        
            self.firstName = firstName;
            self.lastName = lastName;
            self.alias = alias;
            self.photo = photo;
            self.url = url;
            self.affiliation = affiliation;
            self.soundData = soundData;
    }
    
    convenience init(alias : String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation){
            
            self.init(firstName: nil,
                lastName: nil,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: affiliation)
    }
    
}
