//
//  TabBarController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let libraryController = LibraryTableViewController(libraryTableViewModel: LibraryTableViewModel())
        let navigationLibrary = createItem(controller: libraryController, title: "TITLE_VIEW_LIBRARY", image: .home, tag: 0)
        let wishListController = WishListController()
        let navigationWishList = createItem(controller: wishListController, title: "TITLE_VIEW_WISHLIST", image: .wishlist, tag: 1)
        let addNewController = AddNewController(addNewViewModel: AddNewViewModel())
        let navigationAddNew = createItem(controller: addNewController, title: "TITLE_VIEW_ADDNEW", image: .addnew, tag: 3)
        let rentalsController = RentalsViewController()
        let navigationRentals = createItem(controller: rentalsController, title: "TITLE_VIEW_RENTALS", image: .rentals, tag: 4)
        viewControllers = [navigationLibrary, navigationWishList, navigationAddNew, navigationRentals]
       
    }
    
    func createItem(controller: UIViewController, title: String, image: UIImage, tag: Int) -> UINavigationController {
        let navigation = UINavigationController()
        controller.tabBarItem = UITabBarItem()
        controller.tabBarItem.title = NSLocalizedString(title, comment: "").capitalized
        controller.tabBarItem.image = image
        controller.tabBarItem.tag = tag
        navigation.viewControllers = [controller]
        return navigation
    }
    
}
