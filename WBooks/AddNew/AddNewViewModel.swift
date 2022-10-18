//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 18/10/2022.
//

import UIKit

class AddNewViewModel {
    
    func editLines(object: UIView) {
        object.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        object.backgroundColor = .gainsboro
    }
    func editTexts(object: UITextField) {
        object.textColor = .gainsboro
        object.font = UIFont.italicSystemFont(ofSize: 16)
        object.layer.borderColor = .none
    }
    func setUpToPost() {
        
    }
    
}
