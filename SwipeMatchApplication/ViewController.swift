//
//  ViewController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/18/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [redView, blueView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        //        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // autolayout constraint
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//    NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.topAnchor), stackView.leftAnchor.constraint(equalTo: view.leftAnchor), stackView.rightAnchor.constraint(equalTo: view.rightAnchor), stackView.heightAnchor.constraint(equalToConstant: 200)])
        
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 200) )
        
    }
    
    
}

