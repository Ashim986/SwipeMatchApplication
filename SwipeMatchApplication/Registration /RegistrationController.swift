//
//  RegistrationController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/5/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    let userImageButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Select Photo ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        button.layer.cornerRadius = 25
        button.heightAnchor.constraint(equalToConstant: 275).isActive = true
        button.backgroundColor = .white
        return button
    }()
    
    let userFullName: UITextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Enter full name"
        return textField
    }()
    
    let emailAddress: UITextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Enter email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let password: UITextField = {
        let textField = CustomTextField(padding: 16)
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 22
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.backgroundColor = #colorLiteral(red: 0.698841393, green: 0.1527147889, blue: 0.3400550485, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    lazy var registrationComponentView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [userImageButton, userFullName, emailAddress, password, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        addBackgroundGradient()
        view.addSubview(registrationComponentView)
        registrationComponentView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 36, bottom: 0, right: -36))
        registrationComponentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func addBackgroundGradient(){
        let gradient = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.986061275, green: 0.440197885, blue: 0.3446080983, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.9225010276, green: 0.1780227423, blue: 0.446115613, alpha: 1)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.bounds
    }
    
    
}
