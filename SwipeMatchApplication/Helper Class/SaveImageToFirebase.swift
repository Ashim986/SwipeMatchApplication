//
//  SaveImageToFirebase.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

struct SaveImageToFirebase {
    
    static private var initialFetchCompletion: ((URL?, Error?) -> Void)?
    static private var requestQueue = OperationQueue()
    static private var isLoginValid: Bool?
    static private var filename: String?
    static private var imageData: Data?
    static private var error: Error?
    static func userData(with email: String?, _ password: String?, _ imageData: Data?, and fileName: String?, completion: @escaping (URL?, Error?) -> Void ) {
        
        initialFetchCompletion = completion
        
        self.filename = fileName
        self.imageData = imageData
        
        let completionOperation = BlockOperation {
            if isLoginValid == true {
                putImageData()
            } else {
                initialFetchCompletion = nil
            }
        }
        var authOperation = [Operation]()
        let userAuthOperation =  UserAuthorizationOperation(with: email, password: password) {(result, error) in
            guard error == nil else {
                self.isLoginValid = false
                initialFetchCompletion?(nil, error)
                return
            }
            self.isLoginValid = true
        }
        authOperation.append(userAuthOperation)
        completionOperation.addDependency(userAuthOperation)
        
        authOperation.append(completionOperation)
        requestQueue.addOperations(authOperation, waitUntilFinished: false)
    }
    
    private static func putImageData() {
        guard let completion = initialFetchCompletion else {
            return
        }
        let completionOperation = BlockOperation {
            downloadURL()
        }
        var imageDataOperation = [Operation]()
        let addImageDataOperation = AddImageDataOperation(with: imageData, filename: filename) { (metadata, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
        }
        imageDataOperation.append(addImageDataOperation)
        completionOperation.addDependency(addImageDataOperation)
        
        imageDataOperation.append(completionOperation)
        requestQueue.addOperations(imageDataOperation, waitUntilFinished: false)
        
    }
    
    private static func downloadURL() {
        guard let completion = initialFetchCompletion else {
            return
        }
        let completionOperation = BlockOperation {
            initialFetchCompletion = nil
        }
        var downloadOperation = [Operation]()
        let downloadURLOperation = DownloadURLOperation(with: filename) { (url, error) in
            guard let url = url, error == nil else {
                self.error = error
                completion(nil ,error)
                return
            }
            completion(url, nil)
        }
        
        downloadOperation.append(downloadURLOperation)
        completionOperation.addDependency(downloadURLOperation)
        
        downloadOperation.append(completionOperation)
        requestQueue.addOperations(downloadOperation, waitUntilFinished: false)
    }
}
