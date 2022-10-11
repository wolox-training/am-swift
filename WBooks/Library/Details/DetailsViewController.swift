//
//  DetailsViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    private lazy var detailsV = DetailsView()
    private let detailsViewModel: DetailsViewModel
    
    init (detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_VIEW_DETAILS", comment: "")
//        navigationController?.navigationBar.topItem?.backBarButtonItem
        detailsV.setupData(library: detailsViewModel.bookDetails)
    }
    
    override func loadView() {
        view = detailsV
    }
       
    

}
