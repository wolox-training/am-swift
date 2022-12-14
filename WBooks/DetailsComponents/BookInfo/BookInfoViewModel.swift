//
//  BookInfoViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class BookInfoViewModel {
    
    //MARK: Properties
    
    let bookDetails: Library
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookDetails: Library, bookRepository: BookRepository = BookRepository()) {
        self.bookDetails = bookDetails
        self.bookRepository = bookRepository
    }
    
    func rentLibrary () {
        bookRepository.fetchRentsBooks{ [weak self] rent in
            guard let _ = self else {
                return
            }
            debugPrint(rent)
        } onError: { errorLista in
            debugPrint(errorLista.localizedDescription)
        }
    }
    
    func isAvailable() -> Bool {
        return bookDetails.status == "Available"
    }
    
}
