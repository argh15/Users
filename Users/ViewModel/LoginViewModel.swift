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
    
    func performLogin(_ loginBody: Dictionary<String, String>?) {
        LoginManager.sharedInstance.performLogin(loginBody) { [self]
            (result, error)  in
            if error == nil {
                if let token = result {
                    print(token)
                    self.token = token
                    UserDefaults.standard.setIsLoggedIn(true)
                    isLoginSuccess.value = true
                }
            } else {
                errorMessage = error?.errorMessage ?? StringConstants.defaultError
                isLoginSuccess.value = false
            }
        }
    }
    
    func createLoginBody(_ email: String, _ password: String) ->  Dictionary<String, String>? {
        var loginBody = Dictionary<String, String>()
        loginBody["email"] = email
        loginBody["password"] = password
        return loginBody
    }
}
