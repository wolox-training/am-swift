//
//  InputFields.swift
//  WBooks
//
//  Created by ana.mancuso on 19/10/2022.
//

import UIKit

@IBDesignable
open class InputFields: UITextField {
    
    private let underline = CALayer()
    
    func setUpFormat(color: CGColor) {
        borderStyle = .none
        let lineWidth: CGFloat = 0.8
        underline.borderColor = color
        underline.frame = CGRect(x: 0, y: frame.size.height - lineWidth, width: frame.size.width, height: frame.size.height)
        underline.borderWidth = lineWidth
        
        layer.addSublayer(underline)
        layer.masksToBounds = true
        textColor = .gainsboro
        font = UIFont.italicSystemFont(ofSize: 16)
        layer.borderColor = .none
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 35.0)
    }
    
    func textFieldEdit() -> Bool {
        validateColor()
        return (text ?? "").isEmpty
    }
    
    func validateColor() {
        ((text ?? "").isEmpty) ? setUpFormat(color: UIColor.red.cgColor) : setUpFormat(color: UIColor.gainsboro.cgColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFormat(color: UIColor.summerSky.cgColor)
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpFormat(color: UIColor.summerSky.cgColor)
    }
    
}
