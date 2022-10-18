//
//  AddNewBook.swift
//  WBooks
//
//  Created by ana.mancuso on 18/10/2022.
//

/*import UIKit
import os.log

class AddNewBook: NSObject, NSCoding {
    
    //    MARK: Properties
    
        var image: String
        var title: String
        var id: Int
        var author: String
        var year: Int
        var status: String
        var genre: String
        
    //MARK: Types
     
    struct PropertyKey {
        static let title = "title"
        static let image = "image"
        static let author = "author"
        static let year = "year"
        static let status = "status"
        static let genre = "genre"
    }
    
    //    MARK: Initialization
        
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? String
        let author = aDecoder.decodeInteger(forKey: PropertyKey.author) as? String
        let year = aDecoder.decodeObject(forKey: PropertyKey.year) as? Int
        let status = aDecoder.decodeObject(forKey: PropertyKey.status) as? String
        let genre = aDecoder.decodeObject(forKey: PropertyKey.genre) as? String
        
        self.init(title: title, image: image, author: author, year: year, status: status, genre: genre)
        
    }
    init?(title: String, image: String, author: String, year: Int, status: String, genre: String) {
        self.title = title
        self.image = image
        self.author = author
        self.year = year
        self.status = status
        self.genre = genre
    }
        
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(author, forKey: PropertyKey.author)
        aCoder.encode(year, forKey: PropertyKey.year)
        aCoder.encode(status, forKey: PropertyKey.status)
        aCoder.encode(genre, forKey: PropertyKey.genre)
    }
    
}
*/
