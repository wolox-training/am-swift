//
//  LibraryTableViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//
import UIKit

class LibraryTableViewModel {
    
    var library = [Library]()
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookRepository: BookRepository = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadSampleLibrarys() {
        bookRepository.fetchBooks { [weak self] listaDeLibros in
            guard let selfAux = self else {
                return
            }
            selfAux.library = listaDeLibros
            selfAux.changeList?()
        } onError: { errorLista in
            print(errorLista.localizedDescription)
        }
     }
    
    
}
