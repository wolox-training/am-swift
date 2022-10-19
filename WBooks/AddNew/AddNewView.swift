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
            addImage.image = .addImage
            addImage.layer.cornerRadius = 5
        }
    }
    @IBOutlet var titleBook: UITextField! {
        didSet {
            titleBook.placeholder = NSLocalizedString(String(localized: "TITLE_BOOK").capitalized, comment: "")
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
            authorBook.placeholder = NSLocalizedString(String(localized: "AUTHOR_BOOK").capitalized, comment: "")
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
            yearBook.placeholder = NSLocalizedString(String(localized: "YEAR_BOOK").capitalized, comment: "")
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
            genreBook.placeholder = NSLocalizedString(String(localized: "GENRE_BOOK").capitalized, comment: "")
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
            descriptionBook.placeholder = NSLocalizedString(String(localized: "DESCRIPTION_BOOK").capitalized, comment: "")
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
            submitButton.setAttributedTitle(NSAttributedString(string: NSLocalizedString(String(localized: "SUBMIT_BUTTON_TEXT"), comment: "")), for: UIControl.State())
        }
    }
    
}
