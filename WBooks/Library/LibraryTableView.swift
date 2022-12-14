//
//  LibraryTableView.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

final class LibraryTableView: NibView {
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.backgroundColor = .clear
            tableView.separatorStyle = .none
        }
    }
    
    @IBOutlet var generalView: UIView! {
        didSet {
            generalView.backgroundColor = .aliceBlue
        }
    }
    
}
