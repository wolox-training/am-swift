//
//  Rents.swift
//  WBooks
//
//  Created by ana.mancuso on 24/10/2022.
//

struct Rents: Decodable {
    
    //    MARK: Properties
    
    var id: Int
    var book: Library
    var user: Users
    var to: String
    var fromm: String
    
    //    MARK: Initialization
    
    init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
        book = try! container.decode(Library.self, forKey: .book)
        user = try! container.decode(Users.self, forKey: .user)
        to = try! container.decode(String.self, forKey: .to)
        fromm = try! container.decode(String.self, forKey: .fromm)
    }
    
    enum BookKey: String, CodingKey {
        case id
        case book
        case user
        case to
        case fromm = "from"
    }
    
}
