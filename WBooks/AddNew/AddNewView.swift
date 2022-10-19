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
    @IBOutlet var titleBook: UITextField! {
        didSet {
            titleBook.placeholder = String(localized: "TITLE_BOOK").capitalized
            editTexts(object: titleBook)
        }
    }
    @IBOutlet var oneSingleLine: UIView! {
        didSet {
            editLines(object: oneSingleLine)
        }
    }
    @IBOutlet var authorBook: UITextField! {
        didSet {
            authorBook.placeholder = String(localized: "AUTHOR_BOOK").capitalized
            editTexts(object: authorBook)
        }
    }
    @IBOutlet var twoSingleLine: UIView! {
        didSet {
            editLines(object: twoSingleLine)
        }
    }
    @IBOutlet var yearBook: UITextField! {
        didSet {
            yearBook.placeholder = String(localized: "YEAR_BOOK").capitalized
            editTexts(object: yearBook)
        }
    }
    
    @IBOutlet var threeSingleLine: UIView! {
        didSet {
            editLines(object: threeSingleLine)
        }
    }
    @IBOutlet var genreBook: UITextField! {
        didSet {
            genreBook.placeholder = String(localized: "GENRE_BOOK").capitalized
            editTexts(object: genreBook)
        }
    }
    @IBOutlet var fourSingleLine: UIView! {
        didSet {
            editLines(object: fourSingleLine)
        }
    }
    @IBOutlet var descriptionBook: UITextField! {
        didSet {
            descriptionBook.placeholder = String(localized: "DESCRIPTION_BOOK").capitalized
            editTexts(object: descriptionBook)
        }
    }
    @IBOutlet var fiveSingleLine: UIView! {
        didSet {
            editLines(object: fiveSingleLine)
        }
    }
    @IBOutlet var submitButton: UIButton! {
        didSet {
            submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            submitButton.setAttributedTitle(NSAttributedString(string: String(localized: "SUBMIT_BUTTON_TEXT")), for: UIControl.State())
        }
    }
    
}
