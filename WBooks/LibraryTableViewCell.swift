//
//  LibraryTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var libraryView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        libraryView.layer.cornerRadius = 10
    }

}
