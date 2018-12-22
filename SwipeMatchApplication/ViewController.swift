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
        
        let headerViews = [UIColor.gray, UIColor.lightGray, UIColor.darkGray].map { (color) -> UIView in
            let view = UIView()
            view.backgroundColor = color
            return view
        }
     
        let headerStackView = UIStackView(arrangedSubviews: headerViews)
        headerStackView.distribution = .fillEqually
        headerStackView.backgroundColor = .red
        headerStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let footerViews = [UIColor.red, UIColor.black, UIColor.green, UIColor.yellow, UIColor.lightGray].map { (bgcolor) -> UIView in
            let view = UIView()
            view.backgroundColor = bgcolor
            return view
        }
        let footerStackView = UIStackView(arrangedSubviews: footerViews)
        footerStackView.backgroundColor = .yellow
        footerStackView.distribution = .fillEqually
        footerStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, blueView, footerStackView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
       stackView.fillSuperView()

    }
    
    
}

