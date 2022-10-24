//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 18/10/2022.
//

import UIKit

class AddNewViewModel {
    
    //MARK: Properties
    
    var addNewBook: AddNewBook?
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    var titleBook: String = ""
    var authorBook: String = ""
    var genreBook: String = ""
    var yearBook: String = ""
    var descriptionBook: String = ""
    
    init(bookRepository: BookRepository = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func uploadBook(action: @escaping (() -> ())) {
        bookRepository.fetchPostAddNew (request: addNewBook!){ [weak self] books in
            guard let self = self else {
                return
            }
            self.changeList?()
            action()
        } onError: { errorLista in
            debugPrint(errorLista.localizedDescription)
        }
    }
    
    func setContent(title: String, author: String, genre: String, year: String, photo: String) {
        addNewBook = AddNewBook(title: title, author: author, genre: genre, year: year, photo: photo)
    }
    
    func verifyTexts() -> Bool {
        return !(titleBook.isEmpty || authorBook.isEmpty || genreBook.isEmpty || yearBook.isEmpty || descriptionBook.isEmpty)
    }
    
}
