//
//  DownloadURLOperation.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

class DownloadURLOperation: AsynchronousOperation {
    
    private let filename: String?
    private var completion: ((URL?, ServiceError? ,Error?) -> Void)?
    
    init(with filename: String?, completion: @escaping (URL?, ServiceError? ,Error?)-> Void) {
        self.filename = filename
        self.completion = completion
    }
    
    override func execute() {
       guard let fileName = filename  else {
            completion?(nil, ServiceError.invalidRequestData, nil)
            return
        }
        let ref = Storage.storage().reference(withPath: "/images/\(fileName)")
        ref.downloadURL {[weak self] (url, error) in
            if error != nil {
                self?.completion?(url, ServiceError.invalidResponseData, error)
            } else {
                self?.completion?(url, nil, nil)
            }
            self?.finish()
        }
    }
    
}
