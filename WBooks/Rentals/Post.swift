//
//  Post.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//

import UIKit

struct Post: Decodable {
    
    //    MARK: Properties
        var id: Int
        var name: String
        var name2: String
        var genre: String
        var year: String
        var status: String
        var photo: String
    
    //    MARK: Initialization
        
        init(from: Decoder) {
            let container = try! from.container(keyedBy: BookKey.self)
            id = try! container.decode(Int.self, forKey: .id)
            name = try! container.decode(String.self, forKey: .title)
            name2 = try! container.decode(String.self, forKey: .author)
            genre = try! container.decode(String.self, forKey: .genre).capitalized
            year = try! container.decode(String.self, forKey: .year)
            status = try! container.decode(String.self, forKey: .status)
            photo = try! container.decode(String.self, forKey: .image)
        }

        enum BookKey: String, CodingKey {
            case id = "id"
            case title = "title"
            case author = "author"
            case genre = "genre"
            case year = "year"
            case status = "status"
            case image = "image"
        }
    
}