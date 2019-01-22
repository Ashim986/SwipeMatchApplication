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
    private var users: [User]?
    private var advertisers: [Advertise]?
    private var imageIndex = 0
    var imageObserable: ((Int, UIImage?)->())?
    
    init() {
       // addUserDetail()
    }
    
//    private func addUserDetail() {
//        fetchUserDetail()
//        self.advertisers = [
//            Advertise(title: "Slide Out Menu", brandName: "Lets Build That App", posterPhotoName: "slide_out_menu_poster")
//        ]
//    }
    
    func fetchUserDetail(completion : @escaping(Error?) -> Void) {
        FetchUserData.fetchUserData { (users, error) in
            guard let users = users, error == nil else {
                completion(error)
                return
            }
            self.users = users
        }
    }
    
    private func updateImageIndex(imageNames: [String]?) {
        
        guard let imageName = imageNames?[imageIndex] else {
            return
        }
        let image = UIImage(named: imageName)
        imageObserable?(imageIndex, image)
    }
    
    func advanceToNextImage(for imageNames: [String]?){
        guard let imageCount = imageNames?.count else {
            return
        }
        self.imageIndex = min(imageIndex + 1, imageCount - 1)
        updateImageIndex(imageNames: imageNames)
    }
    
    func goToPreviousImage(for imageNames: [String]?) {
        self.imageIndex = max(0, imageIndex - 1)
        updateImageIndex(imageNames: imageNames)
    }
    
    
    func viewForUserModel(viewType: ViewType) -> [UIView]? {
        
        switch viewType {
            
        case .userView:
            let cardView = self.users?.map({ (user) -> UIView in
                let view = CardView(frame: .zero)
                view.user = user
                return view
            })
            return cardView
            
        case .advertiseView:
            let advertiseView = self.advertisers?.map({ (advertise) -> UIView in
                let view = CardView(frame: .zero)
                view.advertise = advertise
                return view
            })
            
            return advertiseView
            
        }
    }
    
}
