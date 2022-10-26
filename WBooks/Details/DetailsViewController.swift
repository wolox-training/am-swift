//
//  DetailsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var detailsV = DetailsView()
    private let detailsViewModel: DetailsViewModel
    
    private let bookInfoViewController: BookInfoViewController
    private let reviewViewController: ReviewViewController
    
    //MARK: Initialization
    
    init(detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        let bookInfoViewModel = detailsViewModel.createBookViewModel()
        bookInfoViewController = BookInfoViewController(bookViewModel: bookInfoViewModel)
        let reviewViewModel = detailsViewModel.createReviewViewModel()
        reviewViewController = ReviewViewController(reviewViewModel: reviewViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
        loadSubviews(controller: reviewViewController, parentView: detailsV.commentsView)
        loadSubviews(controller: bookInfoViewController, parentView: detailsV.headerView)
    }
    
    override func loadView() {
        view = detailsV
    }
    
    func loadSubviews(controller: UIViewController, parentView: UIView) {
        addChild(controller)
        parentView.addSubview(controller.view)
        parentView.addSubViewWithConstraints(child: controller.view, parent: parentView)
        controller.didMove(toParent: self)
    }
}
