//
//  UIView+Extension.swift
//  TQIBank
//
//  Created by Roberth Diorges on 20/01/22.
//

import UIKit

extension UIView {
    
    func addShadow(opacity: Float, offset: CGSize, radius: CGFloat, color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}
