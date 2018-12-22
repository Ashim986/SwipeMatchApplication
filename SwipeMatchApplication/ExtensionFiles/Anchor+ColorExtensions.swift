//
//  AnchorColorExtensions.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/18/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

struct AnchoredConstraint {
    var top, leading, bottom, trailing, width, height : NSLayoutConstraint?
}

extension UIView {
    
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    
    }
    
    func anchorSize(to view: UIView){
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraint = AnchoredConstraint()
        
        if let top = top {
            anchoredConstraint.top = topAnchor.constraint(equalTo: top, constant: padding.top)
            anchoredConstraint.top?.isActive = true
        }
    
        
        if let leading = leading {
            anchoredConstraint.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            anchoredConstraint.leading?.isActive = true
        }
        
        if let trailing = trailing {
            anchoredConstraint.trailing = trailingAnchor.constraint(equalTo: trailing, constant: padding.right)
            anchoredConstraint.trailing?.isActive = true
        }
        
        if let bottom = bottom {
            anchoredConstraint.bottom = bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom)
            anchoredConstraint.bottom?.isActive = true
        }
        
        if size.width != 0 {
            anchoredConstraint.width = widthAnchor.constraint(equalToConstant: size.width)
            anchoredConstraint.width?.isActive = true
        }
        
        if size.height != 0{
            anchoredConstraint.height = heightAnchor.constraint(equalToConstant: size.height)
            anchoredConstraint.height?.isActive = true
        }
    
        return anchoredConstraint
    }
    
}


