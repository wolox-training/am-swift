//
//  RentalsView.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

final class RentalsView: NibView {
    
    @IBOutlet var rentalsView: UIView! {
        didSet {
            rentalsView.backgroundColor = .white
        }
    }

}
