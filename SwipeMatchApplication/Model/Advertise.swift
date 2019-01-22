//
//  Advertise.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/31/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import Foundation

struct Advertise {
    
    let title: String?
    let brandName: String?
    let posterPhotoName: String?
   
    
    init(title: String?, brandName: String?, posterPhotoName: String? ) {
    
        self.title = title
        self.brandName = brandName
        self.posterPhotoName = posterPhotoName
        
    }
}
