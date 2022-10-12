//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import UIKit

class RentalsViewModel {
    
    var postBook = [Post]()
    private let postRepository: PostRepository
    var changeList: (() -> Void)?
    
    init(postRepository: PostRepository = PostRepository()) {
        self.postRepository = postRepository
    }
    
    func loadPost() {
        postRepository.fetchBooks { [weak self] post in
            guard let selfAux = self else {
                return
            }
            selfAux.postBook = post
            selfAux.changeList?()
        } onError: { errorLista in
            print(errorLista.localizedDescription)
        }
     }
    
    
}
