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
        
        guard let userViews = homeViewManager.viewForUserModel(viewType: .userView) else {
            return
        }
        
        guard let advertiseViews = homeViewManager.viewForUserModel(viewType: .advertiseView) else {
            return
        }
        
        advertiseViews.forEach { (view) in
            cardDeckView.addSubview(view)
            view.fillSuperView()
        }
        
        userViews.forEach { (view) in
            cardDeckView.addSubview(view)
            view.fillSuperView()
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

