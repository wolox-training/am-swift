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
    private let reviewRepository: ReviewRepository
    var changeList: (() -> Void)?
    
    init(bookDetails: Library, reviewRepository: ReviewRepository = ReviewRepository()) {
        self.bookDetails = bookDetails
        self.reviewRepository = reviewRepository
    }
    
    func loadSampleLibrarys() {
        reviewRepository.fetchBooks { [weak self] comments in
            guard let selfAux = self else {
                return
            }
            selfAux.reviewer = comments
            selfAux.changeList?()
        } onError: { errorLista in
            print(errorLista.localizedDescription)
        }
     }
    
}


