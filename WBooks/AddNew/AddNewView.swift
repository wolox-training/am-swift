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
            addNewView.layer.cornerRadius = 10
            addNewView.backgroundColor = .white
            addNewView.layer.shadowColor = UIColor.darkGray.cgColor
            addNewView.layer.shadowRadius = 3
            addNewView.layer.shadowOpacity = 0.2
            addNewView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            addNewView.layer.masksToBounds = false
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
            titleBook.placeholder = NSLocalizedString("TITLE_BOOK".capitalized, comment: "")
            AddNewViewModel().editTexts(object: titleBook)

        }
    }
    @IBOutlet var oneSingleLine: UIView! {
        didSet {
            AddNewViewModel().editLines(object: oneSingleLine)
        }
    }
    @IBOutlet var authorBook: UITextField! {
        didSet {
            authorBook.placeholder = NSLocalizedString("AUTHOR_BOOK".capitalized, comment: "")
            AddNewViewModel().editTexts(object: authorBook)
        }
    }
    @IBOutlet var twoSingleLine: UIView! {
        didSet {
            AddNewViewModel().editLines(object: twoSingleLine)
        }
    }
    @IBOutlet var yearBook: UITextField! {
        didSet {
            yearBook.placeholder = NSLocalizedString("YEAR_BOOK".capitalized, comment: "")
            AddNewViewModel().editTexts(object: yearBook)
        }
    }
    
    @IBOutlet var threeSingleLine: UIView! {
        didSet {
            AddNewViewModel().editLines(object: threeSingleLine)
        }
    }
    @IBOutlet var genreBook: UITextField! {
        didSet {
            genreBook.placeholder = NSLocalizedString("GENRE_BOOK".capitalized, comment: "")
            AddNewViewModel().editTexts(object: genreBook)
        }
    }
    @IBOutlet var fourSingleLine: UIView! {
        didSet {
            AddNewViewModel().editLines(object: fourSingleLine)
        }
    }
    @IBOutlet var descriptionBook: UITextField! {
        didSet {
            descriptionBook.placeholder = NSLocalizedString("DESCRIPTION_BOOK".capitalized, comment: "")
            AddNewViewModel().editTexts(object: descriptionBook)
        }
    }
    @IBOutlet var fiveSingleLine: UIView! {
        didSet {
            AddNewViewModel().editLines(object: fiveSingleLine)
        }
    }
    @IBOutlet var submitButton: UIButton! {
        didSet {
            submitButton.setAttributedTitle(NSAttributedString(string: NSLocalizedString("SUBMIT_BUTTON", comment: "")), for: UIControl.State())
            submitButton.applyGradient(colors: [UIColor.lightSeaGreen.cgColor, UIColor.summerSky.cgColor,  UIColor.mediumTurquoise.cgColor], textColor: .white)
        }
    }
    @IBOutlet var selectBookImage: UITapGestureRecognizer!
    
    
}
