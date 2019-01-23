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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SettingHeaderView()
        headerView.delegate = self
        return headerView
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
}

extension SettingViewController: SettingHeaderViewDelegate {
    func didSelectPhoto(button: UIButton) {
        let imagePicker = SettingImagePickerController()
        imagePicker.imageButton = button
        imagePicker.delegate = self
        present(imagePicker, animated:  true)
    }
}

extension SettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        let imageButton = (picker as? SettingImagePickerController)?.imageButton
        imageButton?.setImage(selectedImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
        
    }
}


class SettingImagePickerController: UIImagePickerController {
    var imageButton = UIButton()
}
