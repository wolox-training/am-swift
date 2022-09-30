//
//  detailsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

class detailsViewController: UIViewController {

    private lazy var detailsView = detailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let onSuccess = { books in
            print(books)
        }

        let onError = { error in
            print(error)
        }
        BookRepository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
    override func loadView() {
        view = detailsView
    }
       
    

}
