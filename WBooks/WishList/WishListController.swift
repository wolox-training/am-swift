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

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_VIEW_WISHLIST", comment: "")
        
    }
    
    override func loadView() {
        view = wishlistView
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
