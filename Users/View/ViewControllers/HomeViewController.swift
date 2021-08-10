//
//  HomeViewController.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        let rightBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem  = rightBarButton
    }
    
    @objc func logout() {
        UserDefaults.standard.setIsLoggedIn(false)
        if let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) as? LoginViewController {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(login)
        }
    }
    
    
}
