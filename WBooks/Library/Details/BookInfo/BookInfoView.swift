//
//  BookInfoView.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

final class BookInfoView: NibView {
    
    //MARK: Properties
    
    @IBOutlet var bookView: UIView! {
        didSet {
            backgroundColor = .clear
            bookView.layer.cornerRadius = 10
            bookView.layer.shadowColor = UIColor.darkGray.cgColor
            bookView.layer.shadowRadius = 3
            bookView.layer.shadowOpacity = 0.2
            bookView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            bookView.layer.masksToBounds = false
        }
    }
    @IBOutlet var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 1
        }
    }
    @IBOutlet var bookName: UILabel!
    @IBOutlet var availabilityBook: UILabel!
    @IBOutlet var authorBook: UILabel! {
        didSet {
            authorBook.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        }
    }
    @IBOutlet var yearBook: UILabel! {
        didSet {
            yearBook.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        }
    }
    @IBOutlet var genreBook: UILabel! {
        didSet {
            genreBook.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        }
    }
    @IBOutlet var rentButton: UIButton! {
        didSet {
            rentButton.setTitleColor(.white, for: UIControl.State())
        }
    }
    @IBOutlet var addButton: UIButton! {
        didSet {
            addButton.layer.borderWidth = 2
            addButton.layer.borderColor = UIColor(red: 56/255, green: 170/255, blue: 235/255, alpha: 1).cgColor
            addButton.layer.cornerRadius = 23
            addButton.setTitleColor(UIColor(red: 0.219, green: 0.668, blue: 0.921, alpha: 1), for: UIControl.State())
        }
    }
    
}
