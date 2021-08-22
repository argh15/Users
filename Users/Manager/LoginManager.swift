//
//  LoginManager.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class LoginManager {
    
    let store = LoginStore()
    
    /// This function will make the login request
    ///
    /// Calls the store class function to make a post call with username and password. Receives the response containing token, if error occurs, receives the Server Error with error message.
    /// - Parameters:
    ///        - callback: A callback  with the parameters `result` having the token and `error` which is a ServerError object.
    ///        - body: Dictionary object containing email and password.
    func performLogin(_ body: Dictionary<String, String>?, callback:@escaping (_ result:String?, _ error:ServerError?) -> Void) {
        store.performLogin(body) {
            (result, error) in
            if error == nil {
                callback(result,nil)
            } else {
                callback(nil, error)
            }
        }
    }
}
