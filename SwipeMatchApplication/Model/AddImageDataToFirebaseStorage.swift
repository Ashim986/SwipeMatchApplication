//
//  AddImageDataToFirebaseStorage.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

struct AddImageDataToFirebaseStorage {
    
    static private var initialFetchCompletion: ((URL?, ServiceError?, Error?) -> Void)?
    static private var requestQueue = OperationQueue()
    static private var isLoginValid: Bool?
    
    static func userData(with email: String?, _ password: String?, _ imageData: Data?, and fileName: String, completion: @escaping(URL?, ServiceError?, Error?) ->Void) {
        
        initialFetchCompletion = completion
        
        let completionOperation = BlockOperation {
            putImageData(with: imageData, filename: fileName)
        }
        var authOperation = [Operation]()
        
        let userAuthOperation =  UserAuthorizationOperation(with: email, password: password) { (result, serviceErrorType, error) in
            guard error == nil else {
                self.isLoginValid = false
                return
            }
            self.isLoginValid = true
        }
        authOperation.append(userAuthOperation)
        completionOperation.addDependency(userAuthOperation)
        
        authOperation.append(completionOperation)
        requestQueue.addOperations(authOperation, waitUntilFinished: false)
    }
    
    private static func putImageData(with imageData: Data?, filename: String?) {
        guard let completion = initialFetchCompletion else {
            return
        }
        let completionOperation = BlockOperation {
           downloadURL(filename: filename)
        }
        var imageDataOperation = [Operation]()
        let addImageDataOperation = AddImageDataOperation(with: imageData, filename: filename) { (metadata, errorType ,error) in
                guard error == nil, let errorType = errorType else {
                    return
                }
            if errorType == .invalidRequestData {
               completion(nil, errorType, nil)
               return
            }
        }
        imageDataOperation.append(addImageDataOperation)
        completionOperation.addDependency(addImageDataOperation)

        imageDataOperation.append(completionOperation)
        requestQueue.addOperations(imageDataOperation, waitUntilFinished: false)

    }
    
    private static func downloadURL(filename: String?) {
        guard let completion = initialFetchCompletion else {
            return
        }

        let completionOperation = BlockOperation {
           initialFetchCompletion = nil
        }
        var downloadOperation = [Operation]()
        let downloadURLOperation = DownloadURLOperation(with: filename) { (url, errorType, error) in
            guard let url = url, error == nil else {
                completion(nil, errorType ,error)
                return
            }
            if self.isLoginValid == true {
                completion(url, nil, nil)
            } else {
                completion(nil, ServiceError.authenticationFailed, nil)
            }
        }

        downloadOperation.append(downloadURLOperation)
        completionOperation.addDependency(downloadURLOperation)

        downloadOperation.append(completionOperation)
        requestQueue.addOperations(downloadOperation, waitUntilFinished: false)
    }
}
