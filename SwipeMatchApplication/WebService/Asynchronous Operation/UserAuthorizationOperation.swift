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
    
    private var completion: ((AuthDataResult?, Error?) -> Void)?
    
    init(with email: String?, password: String? ,completion: @escaping (AuthDataResult?, Error?)-> Void) {
        self.email = email
        self.password = password
        self.completion = completion
    }
    
    override func execute() {
        guard let email = email, let password = password else {
            completion?(nil, nil)
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            self?.completion?(authResult, error)
            self?.finish()
        }
    }
    
}
