//
//  ViewController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/18/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let footerStackView = BottomControlStackView()
    let navigationStackView = NavigationStackView()
    var cardDeckView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK:- setupViewComponents
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

