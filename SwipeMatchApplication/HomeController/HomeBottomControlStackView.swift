//
//  HomeButtonControlStackView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

protocol BottomControlStackViewDelegate: class {
    func didTapRefreshButton()
}

class BottomControlStackView: UIStackView {
    weak var delegate: BottomControlStackViewDelegate?
    
   private func createButton(image: UIImage) -> UIButton {
        
        let button = UIButton(type: .system)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        return button
    }
    
    private lazy var refreshButton: UIButton = {
       let button = createButton(image: #imageLiteral(resourceName: "refresh_circle"))
        button.addTarget(self, action: #selector(handleRefreshAction), for: .touchUpInside )
        return button
    }()
    
    private lazy var likeButton = createButton(image: #imageLiteral(resourceName: "like_circle"))
    private lazy var superLikeButton = createButton(image: #imageLiteral(resourceName: "super_like_circle"))
    private lazy var dislikeButton = createButton(image: #imageLiteral(resourceName: "dismiss_circle"))
    private lazy var flashButton = createButton(image: #imageLiteral(resourceName: "boost_circle"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView(){
        
        [refreshButton, dislikeButton, superLikeButton, likeButton, flashButton].forEach { (button) in
            addArrangedSubview(button)
        }
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc private func handleRefreshAction() {
        delegate?.didTapRefreshButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
