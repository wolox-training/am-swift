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
        }
    }
    @IBOutlet var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 5
        }
    }
    @IBOutlet var bookName: UILabel!
    @IBOutlet var availabilityBook: UILabel!
    @IBOutlet var authorBook: UILabel! {
        didSet {
            authorBook.textColor = .gray
        }
    }
    @IBOutlet var yearBook: UILabel! {
        didSet {
            yearBook.textColor = .gray
        }
    }
    @IBOutlet var genreBook: UILabel! {
        didSet {
            genreBook.textColor = .gray
        }
    }
    @IBOutlet var rentButton: UIButton! {
        didSet {
            rentButton.setAttributedTitle(NSAttributedString(string: String(localized: "RENT_BUTTON")), for: UIControl.State())
        }
    }
    @IBOutlet var addButton: UIButton! {
        didSet {
            addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            addButton.setAttributedTitle(NSAttributedString(string: String(localized: "ADD_TO_WISHLIST_BUTTON")), for: UIControl.State())
            addButton.layer.borderWidth = 2
            addButton.layer.borderColor = UIColor.summerSky.cgColor
            addButton.layer.cornerRadius = 23
            addButton.setTitleColor(.summerSky, for: UIControl.State())
        }
    }
    
}
