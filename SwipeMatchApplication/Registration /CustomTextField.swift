//
//  TextView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/5/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit

class CustomTextField: UITextField{
    
    let padding: CGFloat?
    
    init(padding: CGFloat?) {
        self.padding = padding
        super.init(frame: .zero)
        setupViewParameter()
    }
    
    private func setupViewParameter(){
        backgroundColor = .white
        layer.cornerRadius = 20
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 50)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        guard let padding = padding else {
            return .zero
        }
            return bounds.insetBy(dx: padding, dy: 0)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        guard let padding = padding else {
            return .zero
        }
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

