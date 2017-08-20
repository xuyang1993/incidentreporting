//
//  UITextField.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import Foundation

import UIKit


extension UITextField: UITextFieldDelegate {

    // Shake
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 5
        animation.autoreverses = true
        
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 6, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 6, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
        self.setBottomLine(UIColor.blue)
    }
    
    // Bottom Line
    func setBottomLine(_ borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
        
    }
}








