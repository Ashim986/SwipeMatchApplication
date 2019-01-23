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
    
    enum FilterField: String {
        case name
        case age
        case profession
    }
    static private var lastFetchUser: User?
    
    static func fetchUserData(completion: @escaping([User]?, Error?)-> Void){
        /// pagination query
        let query = Firestore.firestore().collection("user").order(by: "uid").start(after: [lastFetchUser?.uid ?? ""]).limit(to: 4)
        
        /// filter query
        
//        let query = Firestore.firestore().collection("user")
//        .whereField(filterField.rawValue, isGreaterThan: queries)
        query.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                completion(nil, error)
                return
            }
            var users = [User]()
            snapshot.documents.forEach({ (documentSnapshot) in
                let userDictionary =  documentSnapshot.data()
                lastFetchUser = User(dictionary: userDictionary)
                users.append(User(dictionary: userDictionary))
            })
            completion(users, nil)
        }
    }
}
