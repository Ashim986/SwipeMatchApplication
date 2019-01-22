//
//  RegistrationManager.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/13/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit
import Firebase


class RegistrationManager {
    
    enum TextFieldType {
        case password
        case email
        case userName
    }
    var isDataValid: Bool = false
    
    var isRegistring = Bindable<Bool>()
    var imageBindable = Bindable<UIImage>()
    var isFormValidBindable = Bindable<Bool>()
    
    private var passwordText: String? {
        didSet{
            updateData()
        }
    }
    private var userNameText: String?{
        didSet{
            updateData()
        }
    }
    private var emailText: String? {
        didSet{
            updateData()
        }
    }
    
    init() {
      
    }
    
    func registerUser(completion: @escaping(Error?) -> Void){
        isRegistring.value = true
        let filename = UUID().uuidString
        let imageData = imageBindable.value?.jpegData(compressionQuality: 0.75)
        SaveImageToFirebase.userData(with: emailText, passwordText, imageData ,and: filename) { [weak self] (url, error) in
            self?.isRegistring.value = false
            guard let url = url, error == nil else {
                completion(error)
                return
            }
            
            print("the url for the given image is ", url)
            completion(nil)
            return 
        }
    }
  
    func updateUserInformation (_ textString: String?, textFieldType: TextFieldType){
        switch textFieldType {
        case .userName:
            userNameText = textString
        case .email:
            emailText = textString
        case .password:
            passwordText = textString
        }
    }
    
    func updateData(){
        let imageData = imageBindable.value
        let isUsername = userNameText?.isEmpty
         isDataValid = emailText?.isEmpty == false && passwordText?.isEmpty == false && isUsername == false && imageData != nil
        isFormValidBindable.value = isDataValid
    }
    
    func updateButton(with image: UIImage?) {
        imageBindable.value = image
    }
}
