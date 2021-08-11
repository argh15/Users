//
//  HomeViewController.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavItems()
        
        addTableViewAttributes()
        
        registerViewModelListeners()
        
        tableView.register(UsersInfoTableViewCell.nib, forCellReuseIdentifier: UsersInfoTableViewCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ActivityIndicator.sharedInstance.showActivityIndicator(self)
        viewModel.fetchUsers()
    }
    
    /// This function will add tableview attributes
    func addTableViewAttributes() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 5
    }
    
    /// This function will logout the user
    @objc func logout() {
        UserDefaults.standard.setIsLoggedIn(false)
        if let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) as? LoginViewController {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(login)
        }
    }
    
    /// This function will add the nav bar items
    func addNavItems() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        let rightBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem  = rightBarButton
    }
    
    /// This function registers ViewModels.
    ///
    /// Handles the success and failure cases for the API calls.
    func registerViewModelListeners() {
        viewModel.isFetchUsersSuccess.bind { [self] success in
            if success {
                ActivityIndicator.sharedInstance.hideActivityIndicator()
                tableView.reloadData()
            } else {
                ActivityIndicator.sharedInstance.hideActivityIndicator()
                AlertView.sharedInstance.showAlert(header: StringConstants.loginFailedHeader, message: viewModel.errorMessage, actionTitle: StringConstants.okTitle)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersInfoTableViewCell.identifier) as? UsersInfoTableViewCell else{
            return UITableViewCell()
        }
        guard let data = viewModel.usersData else {
            return UITableViewCell()
        }
        if let urlString = data[indexPath.row].avatar, let fname = data[indexPath.row].first_name, let lname = data[indexPath.row].last_name, let email = data[indexPath.row].email {
            cell.setData(URL(string: urlString)!, fname, lname, email)
        }
        return cell
    }
}
