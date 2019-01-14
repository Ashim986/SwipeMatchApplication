//
//  RegistrationController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/5/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    let registrationManager = RegistrationManager()
    
    var heightAnchorImageButton: NSLayoutConstraint?
    var widthAnchorImageButton: NSLayoutConstraint?
    
    //MARK:- Properties Decleration
    lazy var  userImageButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Select Photo ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        button.layer.cornerRadius = 25
        heightAnchorImageButton = button.heightAnchor.constraint(equalToConstant: 275)
        widthAnchorImageButton = button.widthAnchor.constraint(equalToConstant: 275)
        button.backgroundColor = .white
        return button
    }()
    
    lazy var userFullName: UITextField = {
        let userTextField = CustomTextField(padding: 16)
        userTextField.delegate = self
        userTextField.placeholder = "Enter full name"
        return userTextField
    }()
    
    lazy var emailAddress: UITextField = {
        let emailTextField = CustomTextField(padding: 16)
        emailTextField.delegate = self
        emailTextField.placeholder = "Enter email"
        emailTextField.keyboardType = .emailAddress
        return emailTextField
    }()
    
    lazy var password: UITextField = {
        let passwordTextField = CustomTextField(padding: 16)
         passwordTextField.delegate = self
        passwordTextField.placeholder = "Enter password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.isEnabled = false
        return button
    }()
    
    lazy var userInfoStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
        userFullName,
        emailAddress,
        password,
        registerButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var registrationComponentView: UIStackView = {
        
       let stackView = UIStackView(arrangedSubviews: [
        userImageButton,
        userInfoStackView
        ])
        stackView.spacing = 8
        return stackView
    }()
    
    var gradientLayer = CAGradientLayer()
    
    // Mark:- view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        notificationForKeyboardDisplay()
        keyboardDismiss()
        updateRegisterButtonStatus()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK:- private functions
    private func setupView(){
        addBackgroundGradient()
        view.addSubview(registrationComponentView)
        registrationComponentView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 36, bottom: 0, right: -36))
        registrationComponentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func updateRegisterButtonStatus(){
    
        registrationManager.isFormValidObserver = { [weak self] (isFormValid) in
            self?.registerButton.isEnabled = isFormValid
            if isFormValid {
                self?.registerButton.backgroundColor = #colorLiteral(red: 0.698841393, green: 0.1527147889, blue: 0.3400550485, alpha: 1)
                self?.registerButton.setTitleColor(.white, for: .normal)
            } else {
                self?.registerButton.backgroundColor = .lightGray
                self?.registerButton.setTitleColor(.darkGray, for: .normal)
            }
            
        }
    }
    
    override func viewWillLayoutSubviews() {
        gradientLayer.frame = view.bounds
        if traitCollection.verticalSizeClass == .compact {
            registrationComponentView.axis = .horizontal
             heightAnchorImageButton?.isActive = false
             widthAnchorImageButton?.isActive = true
        } else {
            registrationComponentView.axis = .vertical
            heightAnchorImageButton?.isActive = true
            widthAnchorImageButton?.isActive = false
        }
        
    }
    
    private func addBackgroundGradient(){
       
        let topColor = #colorLiteral(red: 0.986061275, green: 0.440197885, blue: 0.3446080983, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.9225010276, green: 0.1780227423, blue: 0.446115613, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0,1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
        
    }
    
    private func notificationForKeyboardDisplay(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func handleKeyboardWillShow(notification: Notification) {
        
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let heightForStackView = registrationComponentView.frame.origin.y + registrationComponentView.frame.height
        let bottomHeight = view.frame.height - heightForStackView
        let paddingHeight: CGFloat = 10
        let differenceInHeight = frame.cgRectValue.height - bottomHeight + paddingHeight
        
        self.view.transform = CGAffineTransform(translationX: 0, y: -differenceInHeight)
        
    }
    @objc private func handleKeyWillHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [weak self] in
            self?.view.transform = .identity
        })
    }
    
    private func keyboardDismiss(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func handleTapGesture(gesture: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
}

extension RegistrationController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let textfieldString = textField.text, let stringRange = Range(range, in: textfieldString) {
            let replacementString = textfieldString.replacingCharacters(in: stringRange, with: string)
            if textField == userFullName {
                registrationManager.updateUserInformation(replacementString, textFieldType: .userName)
            } else if textField == emailAddress {
                 registrationManager.updateUserInformation(replacementString, textFieldType: .email)
            } else {
                registrationManager.updateUserInformation(replacementString, textFieldType: .password)
            }
        }
        
        return true
    }
    
}
