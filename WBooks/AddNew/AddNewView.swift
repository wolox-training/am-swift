//
//  AddNewView.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

final class AddNewView: NibView {
    @IBOutlet var backgroundView: UIView! {
        didSet {
            backgroundView.backgroundColor = .aliceBlue
        }
    }
    @IBOutlet var addNewView: UIView! {
        didSet {
            cornerAndShadow(view: addNewView)
        }
    }
    @IBOutlet var addImage: UIImageView! {
        didSet {
            addImage.isUserInteractionEnabled = true
            addImage.image = .addImage
            addImage.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var addButtonImage: UIButton!
    @IBOutlet var titleBook: InputFields! {
        didSet {
            titleBook.placeholder = String(localized: "TITLE_BOOK").capitalized
        }
    }
    @IBOutlet var authorBook: InputFields! {
        didSet {
            authorBook.placeholder = String(localized: "AUTHOR_BOOK").capitalized
        }
    }
    @IBOutlet var yearBook: InputFields! {
        didSet {
            yearBook.placeholder = String(localized: "YEAR_BOOK").capitalized
        }
    }
    @IBOutlet var genreBook: InputFields! {
        didSet {
            genreBook.placeholder = String(localized: "GENRE_BOOK").capitalized
        }
    }
    @IBOutlet var descriptionBook: InputFields! {
        didSet {
            descriptionBook.placeholder = String(localized: "DESCRIPTION_BOOK").capitalized
        }
    }
    @IBOutlet var submitButton: UIButton! {
        didSet {
            submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            submitButton.setAttributedTitle(NSAttributedString(string: String(localized: "SUBMIT_BUTTON_TEXT")), for: UIControl.State())
            
        }
    }
    
}
