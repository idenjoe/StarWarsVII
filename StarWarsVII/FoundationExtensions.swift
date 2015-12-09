//
//  FoundationExtensions.swift
//  StarWarsVII
//
//  Created by José Manuel Rodríguez Moreno on 08/12/15.
//  Copyright © 2015 José Manuel Rodríguez Moreno. All rights reserved.
//

import Foundation
extension NSBundle{
    func URLForResource(fileName: String) -> NSURL?{
        let tokens = fileName.componentsSeparatedByString(".")
        return self.URLForResource(tokens.first, withExtension: tokens.last)
    }
}