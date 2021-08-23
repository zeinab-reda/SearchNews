//
//  CardView.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerradius:CGFloat = 4
    
    @IBInspectable var shadowOffsetWidth:CGFloat = 0
    @IBInspectable var shadowOffsetHeight:CGFloat = 3
    
    @IBInspectable var shadowColor: UIColor = UIColor.gray
    @IBInspectable var shadowOpacity: CGFloat = 0.3
    
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func layoutSubviews() {
        
        // Corner..............
        layer.cornerRadius = cornerradius
        
        // Shadow...........
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        layer.masksToBounds = false
        
        // Border.............
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
