//
//  RentalsController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class RentalsController: UIViewController {

    private lazy var rentalsView = RentalsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = rentalsView
    }
    
}
