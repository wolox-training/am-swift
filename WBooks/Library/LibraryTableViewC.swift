//
//  LibraryTableViewC.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

class LibraryTableViewC: UIViewController {
        
        private lazy var libraryViewC = LibraryTableView()
        private let libraryTableViewModel: LibraryTableViewModel
        
        init(viewModel: LibraryTableViewModel) {
            self.libraryTableViewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override func viewDidLoad() {
            super.viewDidLoad()

            libraryViewC.libraryTableView.delegate = self
            libraryViewC.libraryTableView.dataSource = self
            libraryViewC.libraryTableView.registerCell(cellType: LibraryTableViewCell.self)
            libraryTableViewModel.loadSampleLibrarys()
        }
        
        override func loadView() {
            view = libraryViewC
        }
         
         //MARK: Private Methods
          
        
        
    }
extension LibraryTableViewC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return libraryTableViewModel.library.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellIdentifier = "LibraryTableViewCell"

      guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryTableViewCell  else {
          fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
       }
        cell.setupData(library: libraryTableViewModel.library[indexPath.row])

        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}

