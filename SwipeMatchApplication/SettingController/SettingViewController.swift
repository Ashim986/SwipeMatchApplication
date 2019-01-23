//
//  SettingViewController.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 1/22/19.
//  Copyright © 2019 ashim dahal. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewComponent()
        setupNavigationItem()
    }
    
    private func setupViewComponent() {
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    private func setupNavigationItem() {
        
        navigationItem.title = "Setting"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout)),
            UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        ]
    }
    
    // MARK: - setup view component
    @objc private func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleLogout() {
        print("Logout button tapped")
    }
    @objc private func handleSave() {
        print("Save button tapped")
    }
    
    // MARK: - seutp tableView
    
}
