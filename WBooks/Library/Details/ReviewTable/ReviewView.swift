//
//  ReviewView.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

final class ReviewView: NibView {
    
    //MARK: Properties
    
    @IBOutlet var viewContentTableView: UIView! {
        didSet {
            viewContentTableView.layer.cornerRadius = 10
            viewContentTableView.backgroundColor = .white
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
