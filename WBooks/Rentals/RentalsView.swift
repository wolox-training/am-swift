//
//  RentalsView.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

final class RentalsView: NibView {
    
    @IBOutlet var rentalsView: UIView!
    @IBOutlet var rentalsTableView: UITableView! {
        didSet {
            rentalsView.backgroundColor = UIColor(red: 236/255, green: 248/255, blue: 255/255, alpha: 1)
        }
    }

}
