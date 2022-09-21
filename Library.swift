//
//  Library.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit
import os.log

class Library: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var name2: String
    
    //MARK: Archiving Paths
     
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("library")
    
    //MARK: Types
     
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let name2 = "name2"
    }
    
    //MARK: Initialization
     
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Library object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        guard let name2 = aDecoder.decodeObject(forKey: PropertyKey.name2) as? String else {
            os_log("Unable to decode the name2 for a Library object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, name2: name2)
        
    }
    init?(name: String, photo: UIImage?, name2: String) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        self.name = name
        self.photo = photo
        self.name2 = name2
        // The name is required. If we cannot decode a name string, the initializer should fail.
    }
        
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(name2, forKey: PropertyKey.name2)
        
    }
}

