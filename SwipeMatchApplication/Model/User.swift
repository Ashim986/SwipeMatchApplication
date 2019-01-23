//
//  User.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let name: String?
    let age: Int?
    let profession: String?
    let imageNames: [String]?
    let imageUrl: String?
    let uid: String?
    
//    init(from decoder: Decoder ) throws {
//        let map = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try? map.decode(String.self, forKey: .name)
//        self.age = try? map.decode(Int.self, forKey: .age)
//        self.profession = try? map.decode(String.self, forKey: .profession)
//        self.imageUrl = try? map.decode(String.self, forKey: .imageUrl)
//        self.uid = try? map.decode(String.self, forKey: .uid)
//        self.imageNames = try? map.decode([String].self, forKey: .imageNames)
//    }
//
////    func encode(to encoder: Encoder) throws {
////        var map = encoder.container(keyedBy: CodingKeys.self)
////        try map.encode(name, forKey: .name)
////        try map.encode(age, forKey: .age)
////        try map.encode(profession, forKey: .profession)
////        try map.encode(imageUrl, forKey: .imageUrl)
////        try map.encode(uid, forKey: .uid)
////        try map.encode(imageNames, forKey: .imageNames)
////    }
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case age = "age"
//        case profession = "profession"
//        case imageUrl = "imageUrl"
//        case uid = "uid"
//        case imageNames = "imageNames"
//    }
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String
        self.age = dictionary["age"] as? Int
        self.imageUrl = dictionary["imageUrl"] as? String
        self.profession = dictionary["profession"] as? String
        self.uid = dictionary["uid"] as? String
        self.imageNames = dictionary["imageNames"] as? [String]
        
    }
    
}

