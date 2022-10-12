//
//  DetailsView.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

final class DetailsView: NibView {
    
    //MARK: Properties
    @IBOutlet var detailsBackground: UIView! {
        didSet {
            detailsBackground.backgroundColor = UIColor(red: 236/255, green: 248/255, blue: 255/255, alpha: 1)
        }
    }
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
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookName: UILabel!
    @IBOutlet var availabilityBook: UILabel! {
        didSet {
            availabilityBook.textColor = (availabilityBook.text == "Available") ? UIColor(red: 211/255, green: 41/255, blue: 41/255, alpha: 1) : UIColor(red: 136/255, green: 176/255, blue: 50/255, alpha: 1)
        }
    }
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
    @IBOutlet var rentButtonFormat: UIButton! {
            didSet {
                rentButtonFormat.backgroundColor = (availabilityBook.text == "Unavailable") ? .gray : UIColor(red: 30/255, green: 172/255, blue: 183/255, alpha: 1)
                rentButtonFormat.setTitleColor(.white, for: UIControl.State())
                rentButtonFormat.layer.cornerRadius = 23
            }
    }
    @IBOutlet var tableView: UITableView!
    
    //MARK: Action
    @IBAction func addButton(_ sender: UIButton) {
    }
    @IBAction func rentButton(_ sender: UIButton) {
        let availableToF = (availabilityBook.text.self != nil) ? "Available" : "Unavailable"
        let tabBar = TabBarController()
        let alert = UIAlertController(title: "ERROR", message: NSLocalizedString("COMMENT_BOOKED_ERROR", comment: ""), preferredStyle: .alert)
        let noti = UIAlertController(title: "SUCCESS!", message: NSLocalizedString("COMMENT_BOOKED_SUCCESFULLY", comment: ""), preferredStyle: .alert)
        if availableToF == "true" {
            noti.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
//            self.present(noti, animated: true, completion: nil)
//            let detailsViewModel = DetailsViewModel.init(bookDetails: Library)
//            let detailsViewController = DetailsViewController(detailsViewModel: detailsViewModel)
//            detailsViewController.goToRentals()
        } else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
//            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setupData(library: Library?) {
        bookName.text = library?.name
        authorBook.text = library?.name2
        availabilityBook.text = ((library?.status) != nil) ? "Available" : "Unavailable"
        yearBook.text = library?.year
        genreBook.text = library?.genre
        self.bookImage?.downloaded(from: library?.photo ?? "")
    }
    
}

