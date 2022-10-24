//
//  LoginTextField.swift
//  WBooks
//
//  Created by ana.mancuso on 21/10/2022.
//

import UIKit

@IBDesignable
open class LoginTextField: UITextField, UITextFieldDelegate {
    
    func setUpFormat() {
        borderStyle = .roundedRect
        layer.masksToBounds = true
        textColor = .gainsboro
        font = UIFont.italicSystemFont(ofSize: 16)
        layer.borderColor = .none
    }
    
    @discardableResult func textFieldEdit() -> Bool {
        return ((text!.count) > 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFormat()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpFormat()
    }
    
}

