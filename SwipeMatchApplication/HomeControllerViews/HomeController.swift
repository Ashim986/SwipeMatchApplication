//
//  ViewController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/18/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let homeViewManager = HomeViewManager()
    
    let users = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"),
        User(name: "Jane", age: 23, profession: "Teacher", imageName: "jane1")
    ]
    
    let footerStackView = BottomControlStackView()
    let navigationStackView = NavigationStackView()
    var cardDeckView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardViews()
        setupViews()
    }
    
    //MARK:- setupViewComponents
    fileprivate func setupCardViews(){
        
        homeViewManager.users?.forEach { (user) in
            let cardView = CardView(frame: .zero)
            cardView.cardImageView.image = homeViewManager.getUserImage(imageName: user.imageName)
            cardView.informationLabel.attributedText = homeViewManager.getLabelInformationText(user: user)
            cardDeckView.addSubview(cardView)
            cardView.fillSuperView()
        }
    }
    
    fileprivate func setupViews() {
        
        let stackView = UIStackView(arrangedSubviews: [navigationStackView, cardDeckView, footerStackView])
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        stackView.bringSubviewToFront(cardDeckView)
    }
    
    
    
}

