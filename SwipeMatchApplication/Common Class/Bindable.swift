//
//  Bindable.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/16/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    var value : T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    
    func bind (observer:@escaping ((T?)->())) {
        self.observer = observer
    }
    
}

