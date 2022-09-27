//
//  LibraryTableViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class LibraryTableViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var libraryTableView: UITableView!
    var library : [Library]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
        loadSampleLibrarys()
    }
     
     //MARK: Private Methods
      
    private func loadSampleLibrarys() {
         
        let photo1 = UIImage(named: "Cover1")
        let photo2 = UIImage(named: "Cover2")
        let photo3 = UIImage(named: "Cover3")
        let photo4 = UIImage(named: "Cover4")
        let photo5 = UIImage(named: "Cover5")
         
        let cover1 = Library(name: "A Little Bird Told Me", photo: photo1, name2: "Timothy Cross")
        let cover2 = Library(name: "When the Doves Disappeared", photo: photo2, name2: "Sofi Oksannen")
        let cover3 = Library(name: "The Best Book in the World", photo: photo3, name2: "Peter Sjernstrom")
        let cover4 = Library(name: "Be Creative", photo: photo4, name2: "Tony Alcazar")
        let cover5 = Library(name: "Redesign The Web", photo: photo5, name2: "Liliana Castilla")
         
        library = [cover1, cover2, cover3, cover4, cover5]
         
     }
    
}
extension LibraryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LibraryTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
        }
        let librarys = library?[indexPath.row]
        
        cell.nameLabel.text = librarys?.name
        cell.photoImageView.image = librarys?.photo
        cell.nameLabel2.text = librarys?.name2

        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}
