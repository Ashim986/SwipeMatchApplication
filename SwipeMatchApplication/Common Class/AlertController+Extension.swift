//
//  AlertController+Extension.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/19/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    class func showGenericError(with message: String?) -> UIAlertController {
        let allertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        allertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return allertController
    }
    
}
