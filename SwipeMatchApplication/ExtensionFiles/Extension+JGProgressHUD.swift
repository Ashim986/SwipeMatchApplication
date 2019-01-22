//
//  Extension+JGProgressHUD.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/22/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import Foundation
import JGProgressHUD

extension JGProgressHUD {
    static func showErrorHUD(error: Error?) -> JGProgressHUD {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Failed Registration"
        hud.detailTextLabel.text = error?.localizedDescription
        hud.dismiss(afterDelay: 2, animated: true)
        return hud
    }
    
}
