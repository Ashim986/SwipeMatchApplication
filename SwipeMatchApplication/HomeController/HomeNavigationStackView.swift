//
//  HomeNavigationStackView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class NavigationStackView: UIStackView {
    
    let settingsButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let messageButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let fireImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalCentering
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        setupStackView()
    }
    
    private func setupStackView() {
        [settingsButton, fireImageView, messageButton].forEach { (view) in
            addArrangedSubview(view)
        }
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
