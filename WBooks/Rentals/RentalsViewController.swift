//
//  RentalsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 19/10/2022.
//

import UIKit

class RentalsViewController: UIViewController {

    private lazy var rentalsView = RentalsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_RENTALS", comment: "")
       
    }
    
    override func loadView() {
        view = rentalsView
    }

}
