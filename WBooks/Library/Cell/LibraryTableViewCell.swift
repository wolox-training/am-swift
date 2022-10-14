//
//  LibraryTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    //    MARK: Properties
    
    @IBOutlet weak var libraryView: UIView! {
        didSet {
            libraryView.layer.cornerRadius = 10
            libraryView.layer.shadowColor = UIColor.darkGray.cgColor
            libraryView.layer.shadowRadius = 3
            libraryView.layer.shadowOpacity = 0.2
            libraryView.layer.shadowOffset = CGSize(width: 0.0, height: 0.1)
            libraryView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var nameBookLabel: UILabel!
    @IBOutlet weak var photoBookView: UIImageView!
    @IBOutlet weak var autorBookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(library: Library?) {
        nameBookLabel.text = library?.name
        autorBookName.text = library?.name2
        self.photoBookView?.downloaded(from: library?.photo ?? "")
    }
    
}
