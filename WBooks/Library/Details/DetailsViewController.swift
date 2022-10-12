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
        detailsV.tableView.delegate = self
        detailsV.tableView.dataSource = self
        detailsV.tableView.registerCell(cellType: ReviewTableViewCell.self)
        detailsV.setupData(library: detailsViewModel.bookDetails)
    }
    
    override func loadView() {
        view = detailsV
    }

    func goToRentals() {
        let rentalsViewModel = RentalsViewModel()
        let rentalsViewController = RentalsController(viewModel: rentalsViewModel)
        navigationController?.pushViewController(rentalsViewController, animated: true)
    }

}
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return detailsViewModel.reviewer.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier = "ReviewTableViewCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
                fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
            }
            cell.setupReviewData(reviewer: detailsViewModel.reviewer[indexPath.row])
            return cell
        }

        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }

}

