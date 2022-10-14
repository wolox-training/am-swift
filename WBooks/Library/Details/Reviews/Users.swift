//
//  Users.swift
//  WBooks
//
//  Created by ana.mancuso on 13/10/2022.
//
struct Users: Decodable {
    
    //    MARK: Properties
        var id: Int
        var name: String
        var icon: String
    
    //    MARK: Initialization
        
        init(from: Decoder) {
            let container = try! from.container(keyedBy: BookKey.self)
            id = try! container.decode(Int.self, forKey: .id)
            name = try! container.decode(String.self, forKey: .name)
            icon = try! container.decode(String.self, forKey: .icon)
        }

        enum BookKey: String, CodingKey {
            case id
            case name = "username"
            case icon = "image"
        }
    
}
