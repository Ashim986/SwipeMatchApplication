//
//  ViewController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/18/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit
import JGProgressHUD

class HomeController: UIViewController {
    
    let homeViewManager = HomeViewManager()
    let footerStackView = BottomControlStackView()
    let navigationStackView = NavigationStackView()
    var cardDeckView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchUserCards()
        setupCardViews()
        navigationStackView.settingsButton.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        
    }
    
    private func fetchUserCards(){
        homeViewManager.fetchUserDetail {[unowned self](error) in
            guard error == nil else {
                DispatchQueue.main.async {
                 let errorHud = JGProgressHUD.showErrorHUD(error: error)
                    errorHud.show(in: self.view)
                }
                return
            }
        }
        
        
    }
    
    
    //MARK:- setupViewComponents
    fileprivate func setupCardViews(){
        guard let userViews = homeViewManager.viewForUserModel(viewType: .userView) else {
            return
        }
        guard let advertiseViews = homeViewManager.viewForUserModel(viewType: .advertiseView) else {
            return
        }
        
        advertiseViews.forEach { (view) in
            cardDeckView.addSubview(view)
            view.fillSuperView()
        }
        userViews.forEach { (view) in
            cardDeckView.addSubview(view)
            view.fillSuperView()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [navigationStackView, cardDeckView, footerStackView])
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        stackView.bringSubviewToFront(cardDeckView)
    }
    
    @objc private func handleRegistration(){
        
        let registrationController = RegistrationController()
        present(registrationController, animated: true, completion: nil)
    }
    
    
}

