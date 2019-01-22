//
//  FetchUserData.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/22/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import Firebase

class FetchUserData: NSObject {
    
    static let shared = FetchUserData()
    
    func fetchUserData(completion: @escaping([User]?)-> Void){
    
        
        let jsonData = """
[{
"name": "Sneha",
"age": 21,
"profession": "Nurse",
"imageUrl": "this is image url",
"uid": "asdafjthis is uid",
"imageNames": ["sneha1", "sneha2","sneha3","sneha4","sneha5"]
},
{
"name": "Jane",
"age": 18,
"profession": "Music DJ",
"imageUrl": "this is image url",
"uid": "asdafjthis is uid",
"imageNames": ["jane1", "jane2","jane3"]
},
{
"name": "Kelly",
"age": 23,
"profession": "Teacher",
"imageUrl": "this is image url",
"uid": "asdafjthis is uid",
"imageNames": ["lady5c"]
}]
""".data(using: .utf8)!
        
        
        do {
            let docoder = JSONDecoder()
            let users =  try? docoder.decode([User].self, from: jsonData)
            completion(users)
        } catch let JSONErr{
            print(JSONErr)
            completion(nil)
        }
        
        
    }
}
