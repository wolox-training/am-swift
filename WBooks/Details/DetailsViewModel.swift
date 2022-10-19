//
//  DetailsViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class DetailsViewModel {
    
    //MARK: Properties
    
    let bookDetails: Library
    
    init(bookDetails: Library) {
        self.bookDetails = bookDetails
    }
    
    func createBookViewModel() -> BookInfoViewModel {
        return BookInfoViewModel(bookDetails: bookDetails)
    }
    
    func createReviewViewModel() -> ReviewViewModel {
        return ReviewViewModel(bookID: bookDetails.id)
    }
    
}
