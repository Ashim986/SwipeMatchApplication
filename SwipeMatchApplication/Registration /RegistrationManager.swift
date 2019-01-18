//
//  RegistrationManager.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/13/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit


class RegistrationManager {
    
    enum TextFieldType {
        case password
        case email
        case userName
    }
    var isDataValid: Bool = false
    
    var imageBindable = Bindable<UIImage>()
    var isFormValidBindable = Bindable<Bool>()
    
    var passwordText: String? {
        didSet{
            isDataComplete()
        }
    }
    var userNameText: String?{
        didSet{
            isDataComplete()
        }
    }
    var emailText: String? {
        didSet{
            isDataComplete()
        }
    }
    
//    var isFormValidObserver: ((Bool)->())?
    
    init() {
      
    }
  
    func updateUserInformation (_ textString: String, textFieldType: TextFieldType){
        switch textFieldType {
        case .userName:
            userNameText = textString
        case .email:
            emailText = textString
        case .password:
            passwordText = textString
        }
    }
    
    func isDataComplete(){
         isDataValid = userNameText?.isEmpty == false && emailText?.isEmpty == false && passwordText?.isEmpty == false
        isFormValidBindable.value = isDataValid
    }
}
