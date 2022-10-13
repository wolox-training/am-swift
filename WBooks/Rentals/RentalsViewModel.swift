//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import UIKit

class RentalsViewModel {
    
    var posts = [Post]()
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookRepository: BookRepository = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadPost() {
        bookRepository.fetchPost { [weak self] comments in
            guard let selfAux = self else {
                return
            }
            selfAux.posts = comments
            selfAux.changeList?()
        } onError: { errorLista in
            print(errorLista.localizedDescription)
        }
     }
    
}
