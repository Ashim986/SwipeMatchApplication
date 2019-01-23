//
//  FetchUserData.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/22/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

struct FetchUserData {
    
    static func fetchUserData(completion: @escaping([User]?, Error?)-> Void){
        Firestore.firestore().collection("user").getDocuments { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                completion(nil, error)
                return
            }
            var users = [User]()
            snapshot.documents.forEach({ (documentSnapshot) in
                let userDictionary =  documentSnapshot.data()
                users.append(User(dictionary: userDictionary))
            })
            completion(users, nil)
        }
    }
}
