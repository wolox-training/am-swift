//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

extension UIButton {
    
    func applyGradient(colors: [CGColor], textColor: UIColor) {
        self.backgroundColor = nil
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 23
        gradientLayer.masksToBounds = false
        gradientLayer.locations = [0.0001, 0.002, 1.4]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.titleLabel?.textColor = .white
    }
    
}
