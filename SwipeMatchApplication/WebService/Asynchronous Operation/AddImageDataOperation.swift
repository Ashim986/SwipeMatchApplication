//
//  AddImageDataOperation.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

class AddImageDataOperation: AsynchronousOperation {
    
    private let imageData: Data?
    private let filename: String?
    private var completion: ((StorageMetadata?, ServiceError?, Error?) -> Void)?
    
    init(with imageData: Data?, filename: String?, completion: @escaping (StorageMetadata?,ServiceError? , Error?)-> Void) {
        self.filename = filename
        self.imageData = imageData
        self.completion = completion
    }
    
    override func execute() {
        guard  let imageData = imageData, let fileName = filename  else {
            completion?(nil, ServiceError.invalidRequestData, nil)
            return
        }
        let ref = Storage.storage().reference(withPath: "/images/\(fileName)")
        ref.putData(imageData, metadata: nil) { [weak self] (storageMetadata, error) in
            if error != nil {
                self?.completion?(storageMetadata, ServiceError.invalidResponseData, error)
            } else {
                self?.completion?(storageMetadata, nil, nil)
            }
            
            self?.finish()
        }
    }
    
}
