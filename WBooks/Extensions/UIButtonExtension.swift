//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by ana.mancuso on 17/10/2022.
//

import UIKit

extension UIButton {
    
    func applyGradient(colors: [CGColor]) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 277, height: 46)
        gradientLayer.cornerRadius = 23
        gradientLayer.masksToBounds = false
        gradientLayer.locations = [0.0001, 0.002, 1.4]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.titleLabel?.textColor = UIColor.white
    }
    
}
