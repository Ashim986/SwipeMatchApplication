//
//  HomeControllerManager.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class HomeViewManager {
    
    var users: [User]?
    
    
    init() {
        addUserDetail()
    }
    
    private func addUserDetail() {
        var users = [User]()
        users.append(User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"))
        users.append(User(name: "Jane", age: 18, profession: "Teacher", imageName: "jane1"))
        self.users = users
    }
    
    func getLabelInformationText(user: User) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedString.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light)]))
        attributedString.append(NSAttributedString(string: "\n \(user.profession)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        
        return  attributedString
    }
    
    func getUserImage(imageName: String) -> UIImage? {
       let image =  UIImage(named: imageName)
       return image
    }
    
    
}
