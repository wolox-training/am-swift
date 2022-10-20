//
//  AddNewBook.swift
//  WBooks
//
//  Created by ana.mancuso on 18/10/2022.
//

import UIKit
import os.log

struct AddNewBook: Codable {
    
    var title: String
    var author: String
    var genre: String
    var year: String
    var photo: String
}
/* class AddNewBook: Decodable {
    
 //    MARK: Initialization
     
    required init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        title = try! container.decode(String.self, forKey: .title)
        author = try! container.decode(String.self, forKey: .author)
        genre = try! container.decode(String.self, forKey: .genre)
        year = try! container.decode(Int.self, forKey: .year)
        photo = try! container.decode(String.self, forKey: .image)
    }
    
     enum BookKey: String, CodingKey {
         case title
         case author
         case genre
         case year
         case image
     }
 
}*/

