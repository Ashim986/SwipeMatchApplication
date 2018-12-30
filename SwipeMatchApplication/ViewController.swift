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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK:- setupViewComponents
    fileprivate func setupViews() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [navigationStackView, blueView, footerStackView])
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    
    
}

