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
            rentButton.setTitleColor(.white, for: UIControl.State())
        }
    }
    @IBOutlet var addButton: UIButton! {
        didSet {
            addButton.layer.borderWidth = 2
            addButton.layer.borderColor = UIColor.summerSky.cgColor
            addButton.layer.cornerRadius = 23
            addButton.setTitleColor(.summerSky, for: UIControl.State())
        }
    }
    
}
