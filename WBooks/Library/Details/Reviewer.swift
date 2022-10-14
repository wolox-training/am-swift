//
//  Reviewer.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//

struct Reviewer: Decodable {
    
    //    MARK: Properties
    
    var id: Int
    var info: Users
    var comment: String
    
    //    MARK: Initialization
    
    init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
        info = try! container.decode(Users.self, forKey: .info)
        comment = try! container.decode(String.self, forKey: .comment)
    }
    
    enum BookKey: String, CodingKey {
        case id
        case info = "user"
        case comment = "content"
    }
    
}
