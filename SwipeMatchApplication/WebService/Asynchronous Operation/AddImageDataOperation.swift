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
    private var completion: ((StorageMetadata?, Error?) -> Void)?
    
    init(with imageData: Data?, filename: String?, completion: @escaping (StorageMetadata?, Error?)-> Void) {
        self.filename = filename
        self.imageData = imageData
        self.completion = completion
    }
    
    override func execute() {
        guard  let imageData = imageData, let fileName = filename  else {
            completion?(nil, nil)
            return
        }
        let ref = Storage.storage().reference(withPath: "/images/\(fileName)")
        ref.putData(imageData, metadata: nil) { [weak self] (storageMetadata, error) in
            self?.completion?(storageMetadata, error)
            self?.finish()
        }
    }
    
}
