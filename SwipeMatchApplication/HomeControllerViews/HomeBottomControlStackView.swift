//
//  HomeButtonControlStackView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class BottomControlStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    private func setupView(){
        
        let footerViews = [#imageLiteral(resourceName: "refresh_circle"),#imageLiteral(resourceName: "dismiss_circle"),#imageLiteral(resourceName: "super_like_circle"),#imageLiteral(resourceName: "like_circle"),#imageLiteral(resourceName: "boost_circle")].map { (image) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 80).isActive = true
       
        footerViews.forEach { (view) in
            addArrangedSubview(view)
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
