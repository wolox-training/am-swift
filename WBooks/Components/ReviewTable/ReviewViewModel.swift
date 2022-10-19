//
//  ReviewViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class ReviewViewModel {
    
    //MARK: Properties
    
    let bookID: Int
    var reviewer = [Reviewer]()
    private let bookRepository: BookRepository
    var changeList: (() -> Void)?
    
    init(bookID: Int, bookRepository: BookRepository = BookRepository()) {
        self.bookID = bookID
        self.bookRepository = bookRepository
    }
    
    func loadSampleLibrarys(action: @escaping (() -> ())) {
        bookRepository.fetchComments (id: bookID){ [weak self] comments in
            guard let self = self else {
                return
            }
            self.reviewer = comments
            self.changeList?()
            action()
        } onError: { errorLista in
            debugPrint(errorLista.localizedDescription)
        }
    }
    
}

