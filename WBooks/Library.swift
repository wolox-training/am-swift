//
//  Library.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class Library {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var name2: String
    
    
    //MARK: Initialization
    
    init(name: String, photo: UIImage?, name2: String) {
        
        self.name = name
        self.photo = photo
        self.name2 = name2
        }
    
}

