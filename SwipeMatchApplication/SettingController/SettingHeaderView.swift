//
//  SettingHeaderView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/23/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit

protocol SettingHeaderViewDelegate: class {
    
    func didSelectPhoto(button: UIButton)
}

class SettingHeaderView: UIView {
    
    weak var delegate: SettingHeaderViewDelegate?
    
    private func createButton(selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
//        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Select Photo", for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.backgroundColor = .white
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }

  
    lazy var imageButtonStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [rightUpperImageButton, rightLowerImageButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var overallStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [leftImageButton, imageButtonStackView])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    lazy var leftImageButton = createButton(selector: #selector(handlePhotoSelector))
    lazy var rightUpperImageButton = createButton(selector: #selector(handlePhotoSelector))
    lazy var rightLowerImageButton = createButton(selector: #selector(handlePhotoSelector))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewAndConstraint()
    }
    
   
    @objc private func handlePhotoSelector(button: UIButton) {
        delegate?.didSelectPhoto(button: button)
    }
    
    private func setupViewAndConstraint() {
        addSubview(overallStackView)
        overallStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

