//
//  BookInfoViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

class BookInfoViewController: UIViewController {

    //MARK: Properties
    
    private lazy var bookView = BookInfoView()
    private let bookModel: BookInfoViewModel
    
    //MARK: Initialization
    
    init (bookModel: BookInfoViewModel) {
        self.bookModel = bookModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBook()
    }
    
    override func loadView() {
        view = bookView
    }
    
    func configBook() {
        setupData(library: bookModel.bookDetails)
        bookView.rentButton.addTarget(self, action:#selector(rentButton), for: .touchUpInside)
        bookView.rentButton.applyGradient(colors: ((bookView.availabilityBook.text == "Available") ? [UIButton.UIColorFromRGB(0x1EACB7).cgColor, UIButton.UIColorFromRGB(0x38AAEB).cgColor,  UIButton.UIColorFromRGB(0x38CCCE).cgColor] : [UIButton.UIColorFromRGB(0xE3E3E3).cgColor]))
        bookView.addButton.addTarget(self, action:#selector(addButton), for: .touchUpInside)
        bookView.availabilityBook.textColor = (bookView.availabilityBook.text == "Available") ? UIColor(red: 136/255, green: 176/255, blue: 50/255, alpha: 1) : UIColor(red: 211/255, green: 41/255, blue: 41/255, alpha: 1)
    }

    //MARK: Action
    
    @objc func addButton() {
    }
    
    @objc func rentButton() {
        alertConfiguration()
        bookModel.rentLibrary()
    }

    func alertConfiguration () {
        let availableToF = (bookView.availabilityBook.text.self != nil) ? "Available" : "Unavailable"
        let title = NSLocalizedString("ALERT_BOOKED_SUCCESSFULLY", comment: "")
        let succesTitle = NSLocalizedString("COMMENT_BOOKED_SUCCESFULLY", comment: "")
        let errorTitle = NSLocalizedString("COMMENT_BOOKED_ERROR", comment: "")
        let noRentTitle = NSLocalizedString("COMMENT_BOOKED_NO_RENT", comment: "")
        let noti = UIAlertController(title: title, message: succesTitle.capitalized, preferredStyle: .alert)
        let alert = UIAlertController(title: "OH NO!", message: noRentTitle.capitalized, preferredStyle: .alert)
        let error = UIAlertController(title: "ERROR", message: errorTitle.capitalized, preferredStyle: .alert)
        
        if availableToF == "Available" {
            noti.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(noti, animated: true, completion: nil)
        } else if availableToF == "Unavailable" {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(error, animated: true, completion: nil)
        }
    }
    
    func setupData(library: Library?) {
        bookView.bookName.text = library?.name
        bookView.authorBook.text = library?.name2
        bookView.availabilityBook.text = library?.status
        bookView.yearBook.text = library?.year
        bookView.genreBook.text = library?.genre
        self.bookView.bookImage?.downloaded(from: library?.photo ?? "")
    }
}
