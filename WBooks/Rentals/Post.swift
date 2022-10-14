//
//  Post.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//

struct Post: Decodable {
    
    //    MARK: Properties
    
    var id: Int
    
    //    MARK: Initialization
    
    init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
    }
    
    enum BookKey: String, CodingKey {
        case id
    }
    
}
