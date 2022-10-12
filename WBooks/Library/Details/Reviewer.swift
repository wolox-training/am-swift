//
//  Reviewer.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import UIKit

struct Reviewer: Decodable {
    
    //    MARK: Properties
        var id: Int
        var name: String
        var photo: String
        var comment: String
    
    //    MARK: Initialization
        
        init(from: Decoder) {
            let container = try! from.container(keyedBy: BookKey.self)
            id = try! container.decode(Int.self, forKey: .id)
            name = try! container.decode(String.self, forKey: .name)
            photo = try! container.decode(String.self, forKey: .image)
            comment = try! container.decode(String.self, forKey: .comment)
        }

        enum BookKey: String, CodingKey {
            case id = "id"
            case name = "name"
            case image = "image"
            case comment = "comment"
        }
    
}
