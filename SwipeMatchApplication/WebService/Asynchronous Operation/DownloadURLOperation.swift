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
    private var completion: ((URL?, Error?) -> Void)?
    
    init(with filename: String?, completion: @escaping (URL?, Error?)-> Void) {
        self.filename = filename
        self.completion = completion
    }
    
    override func execute() {
       guard let fileName = filename  else {
            completion?(nil, nil)
            return
        }
        let ref = Storage.storage().reference(withPath: "/images/\(fileName)")
        ref.downloadURL {[weak self] (url, error) in
            self?.completion?(url, error)
            self?.finish()
        }
    }
    
}
