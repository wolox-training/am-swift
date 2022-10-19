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
            tableView.layer.cornerRadius = 10
        }
    }
    
}
