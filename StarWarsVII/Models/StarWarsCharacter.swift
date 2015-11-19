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
    let affiliation :   String
    let soundData   :   NSData
    
    //MARK: - Init
    init(firstName: String?,
        lastName : String?,
        alias : String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: String){
        
            self.firstName = firstName;
            self.lastName = lastName;
            self.alias = alias;
            self.photo = photo;
            self.url = url;
            self.affiliation = affiliation;
            self.soundData = soundData;
    }
    
}
