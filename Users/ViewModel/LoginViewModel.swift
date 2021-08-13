//
//  LoginViewModel.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class LoginViewModel {
    
    var isLoginSuccess: Dynamic<Bool> = Dynamic(false)
    var token = ""
    var errorMessage = ""
    var manager = LoginManager()
    
    /// This function will make the login request
    ///
    /// Calls the manager class function to make a post call with username and password.
    /// Receives the response containing token, if error occurs, receives the Server Error with error message.
    /// If error nil, will set the token to class variable and set isLoginSuccess to true
    /// If error not nil, will set the error message and isLoginSuccess to false
    ///
    /// - Parameter body: Dictionary object containing email and password.
    func performLogin(_ loginBody: Dictionary<String, String>?) {
        manager.performLogin(loginBody) { [weak self]
            (result, error)  in
            if error == nil {
                if let token = result {
                    self?.token = token
                    UserDefaults.standard.setIsLoggedIn(true)
                    self?.isLoginSuccess.value = true
                }
            } else {
                self?.errorMessage = error?.errorMessage ?? StringConstants.defaultError
                self?.isLoginSuccess.value = false
            }
        }
    }
    
    /// This function will create the json for the post call with passed `email` & `password`
    ///
    /// - Parameters:
    ///     - email: Email ID
    ///     - password: Password
    /// - Returns: Dictionary with email and password
    func createLoginBody(_ email: String, _ password: String) ->  Dictionary<String, String>? {
        var loginBody = Dictionary<String, String>()
        loginBody["email"] = email
        loginBody["password"] = password
        return loginBody
    }
}
