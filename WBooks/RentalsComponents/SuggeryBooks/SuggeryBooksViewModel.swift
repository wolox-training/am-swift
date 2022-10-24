//
//  SuggeryBooksViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

class SuggeryBooksViewModel {
    
    var library = [Library]()
    private let bookRepository: BookRepository
    
    init(bookRepository: BookRepository = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadSampleLibrarys(action: @escaping () -> ()) {
        bookRepository.fetchSuggeryBooks { [weak self] listaDeLibros in
            guard let self = self else {
                return
            }
            self.library = listaDeLibros
            action()
        } onError: { errorLista in
            debugPrint(errorLista.localizedDescription)
        }
    }
    
}

