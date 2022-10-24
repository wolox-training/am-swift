//
//  RentalsTableViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 22/10/2022.
//

import UIKit

class RentalsTableViewController: UIViewController {
    
    private lazy var rentalsTableView = RentalsTableView()
    private let rentalsTableViewModel: RentalsTableViewModel
    
    init(rentalsTableViewModel: RentalsTableViewModel) {
        self.rentalsTableViewModel = rentalsTableViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        rentalsTableViewModel.changeList = { [weak self] in
            self?.rentalsTableView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = rentalsTableView
    }
    
    func configTableView() {
        rentalsTableView.tableView.delegate = self
        rentalsTableView.tableView.dataSource = self
        rentalsTableView.tableView.registerCell(cellType: RentalsTableViewCell.self)
        rentalsTableViewModel.loadSampleLibrarys()
    }
    
}
extension RentalsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rentalsTableViewModel.rents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RentalsTableViewCell.cellIdentifier, for: indexPath) as? RentalsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RentalsTableViewCell.")
        }
        cell.setupRentsBooks(rents: rentalsTableViewModel.rents[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let libraryTableView = rentalsTableViewModel.rents[indexPath.row].book
        let detailsViewModel = DetailsViewModel(bookDetails: libraryTableView)
        let detailsViewController = DetailsViewController(detailsViewModel: detailsViewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
