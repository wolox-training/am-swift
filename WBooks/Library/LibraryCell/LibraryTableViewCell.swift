//
//  LibraryTableViewCell.swift
//  WBooks
//
//  Created by ana.mancuso on 20/09/2022.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    //    MARK: Properties
    
    let cellIdentifier = "LibraryTableViewCell"
    
    @IBOutlet weak var libraryView: UIView! {
        didSet {
           cornerAndShadow(view: libraryView)
        }
    }
    @IBOutlet weak var nameBookLabel: UILabel!
    @IBOutlet weak var photoBookView: UIImageView!
    @IBOutlet weak var authorBookName: UILabel!
    
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
        authorBookName.text = library?.name2
        photoBookView?.downloaded(from: library?.photo ?? "")
    }
    
}
