//
//  DetailsViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 11/10/2022.
//
import UIKit

class DetailsViewModel {
    
    let bookDetails: Library
    var reviewer = [Reviewer]()
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookDetails: Library, bookRepository: BookRepository = BookRepository()) {
        self.bookDetails = bookDetails
        self.bookRepository = bookRepository
    }
    
    func loadSampleLibrarys() {
        bookRepository.fetchComments (id: bookDetails.id){ [weak self] comments in
            guard let selfAux = self else {
                return
            }
            selfAux.reviewer = comments
            selfAux.changeList?()
        } onError: { errorLista in
            print(errorLista.localizedDescription)
            
        }
     }
    
    func rentLibrary () {
        bookRepository.fetchPost(id: bookDetails.id){ [weak self] rent in
            guard let selfAux = self else {
                return
            }
            debugPrint(rent)
        } onError: { errorLista in
            print(errorLista.localizedDescription)
            
        }
    }
    
}


