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
                rentButton.layer.cornerRadius = 23
            }
    }
    @IBOutlet var addButton: UIButton!
    @IBOutlet var viewContentTableView: UIView! {
        didSet {
            viewContentTableView.layer.cornerRadius = 10
            viewContentTableView.backgroundColor = .white
            viewContentTableView.layer.shadowColor = UIColor.darkGray.cgColor
            viewContentTableView.layer.shadowRadius = 3
            viewContentTableView.layer.shadowOpacity = 0.2
            viewContentTableView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            viewContentTableView.layer.masksToBounds = false
        }
    }
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.separatorColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
            tableView.layer.cornerRadius = 10
        }
    }
    
}

