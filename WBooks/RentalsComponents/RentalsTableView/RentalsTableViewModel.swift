//
//  RentalsTableViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

class RentalsTableViewModel {
    
    var rents = [Rents]()
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookRepository: BookRepository = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadSampleLibrarys() {
        bookRepository.fetchRentsBooks { [weak self] rentsBooks in
            guard let self = self else {
                return
            }
            self.rents = rentsBooks
            self.changeList?()
        } onError: { errorLista in
            debugPrint(errorLista.localizedDescription)
        }
    }
    
}
