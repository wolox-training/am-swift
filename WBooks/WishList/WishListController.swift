//
//  WishListController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class WishListController: UIViewController {
    
    private lazy var wishlistView = WishListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_VIEW_WISHLIST", comment: "")
    }
    
    override func loadView() {
        view = wishlistView
    }
    
}
