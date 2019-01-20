//
// UserAuthorizationOperation.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

class UserAuthorizationOperation: AsynchronousOperation {
    
    let email: String?
    let password: String?
    
    private var completion: ((AuthDataResult?, ServiceError?, Error?) -> Void)?
    
    init(with email: String?, password: String? ,completion: @escaping (AuthDataResult?, ServiceError?, Error?)-> Void) {
        self.email = email
        self.password = password
        self.completion = completion
    }
    
    override func execute() {
        guard let email = email, let password = password else {
            completion?(nil, ServiceError.invalidRequestData, nil)
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            if error != nil {
                self?.completion?(authResult, ServiceError.invalidResponseData, error)
            } else {
                self?.completion?(authResult, nil, nil)
            }
            self?.finish()
        }
    }
    
}
