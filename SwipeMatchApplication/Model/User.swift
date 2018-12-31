//
//  User.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import Foundation

struct User {
    
    let name: String?
    let age: Int?
    let profession: String?
    let imageName: String?
    
    init(name: String?, age: Int?, profession: String?, imageName: String?) {
        
        self.name = name
        self.age = age
        self.profession = profession
        self.imageName = imageName
        
    }
    
}

