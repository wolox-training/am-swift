//
//  RentalsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 19/10/2022.
//

import UIKit

class RentalsViewController: UIViewController {

    //MARK: Properties
    
    private lazy var rentalsView = RentalsView()
    private let rentalsViewModel: RentalsViewModel
    
    private let rentalsTableViewController: RentalsTableViewController
    private let suggeryBooksViewController: SuggeryBooksViewController
    
    //MARK: Initialization
    
    init(rentalsViewModel: RentalsViewModel) {
        self.rentalsViewModel = rentalsViewModel
        let rentalsTViewModel = rentalsViewModel.createRentalsTableViewModel()
        rentalsTableViewController = RentalsTableViewController(rentalsTableViewModel: rentalsTViewModel)
        let suggeryBViewModel = rentalsViewModel.createSuggeryModel()
        suggeryBooksViewController = SuggeryBooksViewController(suggeryBooksViewModel: suggeryBViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
        loadSubviews(controller: rentalsTableViewController, parentView: rentalsView.headerTableView)
        loadSubviews(controller: suggeryBooksViewController, parentView: rentalsView.suggeryBooksView)
    }
    
    override func loadView() {
        view = rentalsView
    }
    
    func loadSubviews(controller: UIViewController, parentView: UIView) {
        addChild(controller)
        parentView.addSubview(controller.view)
        parentView.addSubViewWithConstraints(child: controller.view, parent: parentView)
        controller.didMove(toParent: self)
    }
}
