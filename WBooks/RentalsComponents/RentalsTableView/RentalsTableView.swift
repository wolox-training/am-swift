//
//  RentalsTableView.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

final class RentalsTableView: NibView {
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.backgroundColor = .aliceBlue
            tableView.separatorStyle = .none
        }
    }
    
}
