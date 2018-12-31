//
//  HomeControllerManager.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class HomeViewManager {
    
    enum ViewType {
        case userView
        case advertiseView
    }
    
    var users: [User]?
    var advertisers: [Advertise]?
    var allignment: NSTextAlignment?
    var attributedString: NSAttributedString?
    
    init() {
        addUserDetail()
    }
    
    private func addUserDetail() {
        var users = [User]()
        users.append(User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"))
        users.append(User(name: "Jane", age: 18, profession: "Teacher", imageName: "jane1"))
        self.users = users
        
        self.advertisers = [
        Advertise(title: "Slide Out Menu", brandName: "Lets Build That App", posterPhotoName: "slide_out_menu_poster")
        ]
        
    }
    
    func viewForUserModel(viewType: ViewType) -> [UIView]? {
        
        switch viewType {
            
        case .userView:
            let cardView = self.users?.map({ (user) -> UIView in
                let view = CardView(frame: .zero)
                view.cardImageView.image = getImage(for: user.imageName)
                view.informationLabel.attributedText = getAtrributedText(for: user)
                return view
            })
            return cardView
          
        case .advertiseView:
            let advertiseView = self.advertisers?.map({ (advertise) -> UIView in
                let view = CardView(frame: .zero)
                view.cardImageView.image = getImage(for: advertise.posterPhotoName)
                view.informationLabel.attributedText = getAttrributedText(for: advertise)
                view.informationLabel.textAlignment = .center
                return view
            })
            
           return advertiseView
         
        }
        
       
    }
    private func getAttrributedText(for advertise: Advertise) -> NSAttributedString?{
        
        guard  let title = advertise.title, let brandName = advertise.brandName else {
            return nil
        }
        
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedString.append(NSAttributedString(string: "\n \(brandName)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        return attributedString
    }
    
    private func getAtrributedText(for user: User) -> NSAttributedString?{
        guard  let name = user.name, let age = user.age, let profession = user.profession else {
            return nil
        }
        
        let attributedString = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedString.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light)]))
        attributedString.append(NSAttributedString(string: "\n \(profession)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        
        return attributedString
        
    }
    
    
    private func getImage(for imageName: String?) -> UIImage? {
        guard let imageName = imageName else{
            return nil
        }
       let image =  UIImage(named: imageName)
       return image
    }
    
    
}
