//
//  ViewController.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //to handle keyboard when tapped on screen
        hideKeyboardWhenTappedAround()
        
        //delegates for UITextField
        emailText.delegate = self
        passwordText.delegate = self
        
        registerViewModelListeners()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    /// This function registers ViewModels.
    ///
    /// Handles the success and failure cases for the API calls.
    func registerViewModelListeners() {
        viewModel.isLoginSuccess.bind { [self] success in
            if success {
                ActivityIndicator.sharedInstance.hideActivityIndicator()
                openHomeScreen()
            } else {
                ActivityIndicator.sharedInstance.hideActivityIndicator()
                AlertView.sharedInstance.showAlert(header: StringConstants.loginFailedHeader, message: viewModel.errorMessage, actionTitle: StringConstants.okTitle)
            }
        }
    }

    @IBAction func loginAction(_ sender: Any) {
        validateAndLogin()
    }
    
    /// This function will perform validations in the text field and hence initiate login flow
    func validateAndLogin() {
        guard let email = emailText.text, let password = passwordText.text else {
            return
        }
        
        if !email.isEmpty || !password.isEmpty {
            if password == StringConstants.password{
                ActivityIndicator.sharedInstance.showActivityIndicator(self)
                viewModel.performLogin(viewModel.createLoginBody(email, password))
            } else {
                AlertView.sharedInstance.showAlert(header: StringConstants.defaultErrorHeader, message: StringConstants.passwordWrong, actionTitle: StringConstants.okTitle)
            }
        } else {
            AlertView.sharedInstance.showAlert(header: StringConstants.defaultErrorHeader, message: StringConstants.blankFields, actionTitle: StringConstants.okTitle)
        }
    }
    
    /// This function will open the home screen.
    func openHomeScreen() {
        if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: HomeViewController.identifier) as? HomeViewController {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(homeVC)
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    /// To move to next text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textTag = textField.tag+1
        
        let nextResponder = textField.superview?.viewWithTag(textTag)
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        }else {
            self.view.endEditing(true)
        }
        
        return true
    }
    
    /// Scroll to text field's top when start editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: self.view.frame.origin.x, y: textField.frame.origin.y - 150), animated: true)
    }
    
    /// Scroll back to normal view post editing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

