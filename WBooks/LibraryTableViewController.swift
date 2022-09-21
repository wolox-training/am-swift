//
//  LibraryTableViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit
import os.log

class LibraryTableViewController: UITableViewController {

    //MARK: Properties
    var library = [Library]()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        if let savedLibrary = loadLibrary() {
            library += savedLibrary
        }
        else {
            // Load the sample data.
            loadSampleLibrarys()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LibraryTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LibraryTableViewCell.")
        }
        let librarys = library[indexPath.row]
        
        cell.nameLabel.text = librarys.name
        cell.photoImageView.image = librarys.photo
        cell.nameLabel2.text = librarys.name2

        return cell
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            library.remove(at: indexPath.row)
            saveLibrary()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     
     //MARK: Private Methods
      
     private func loadSampleLibrarys() {
         
         let photo1 = UIImage(named: "cover1")
         let photo2 = UIImage(named: "cover2")
         let photo3 = UIImage(named: "cover3")
         let photo4 = UIImage(named: "cover4")
         let photo5 = UIImage(named: "cover5")
         
         guard let cover1 = Library(name: "A Little Bird Told Me", photo: photo1, name2: "Timothy Cross") else {
             fatalError("Unable to instantiate cover1")
         }
          
         guard let cover2 = Library(name: "When the Doves Disappeared", photo: photo2, name2: "Sofi Oksannen") else {
             fatalError("Unable to instantiate cover2")
         }
         guard let cover3 = Library(name: "The Best Book in the World", photo: photo3, name2: "Peter Sjernstrom") else {
             fatalError("Unable to instantiate cover3")
         }
         guard let cover4 = Library(name: "Be Creative", photo: photo4, name2: "Tony Alcazar") else {
             fatalError("Unable to instantiate cover4")
         }
         guard let cover5 = Library(name: "Redesign The Web", photo: photo5, name2: "Liliana Castilla") else {
             fatalError("Unable to instantiate cover5")
         }
         
         library += [cover1, cover2, cover3, cover4, cover5]
         
     }
     private func saveLibrary() {
         let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(library, toFile: Library.ArchiveURL.path)
         if isSuccessfulSave {
             os_log("Library successfully saved.", log: OSLog.default, type: .debug)
         } else {
             os_log("Failed to save Library...", log: OSLog.default, type: .error)
         }
     }
     private func loadLibrary() -> [Library]? {
         return NSKeyedUnarchiver.unarchiveObject(withFile: Library.ArchiveURL.path) as? [Library]
     }
}
