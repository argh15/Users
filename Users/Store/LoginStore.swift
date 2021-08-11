//
//  LoginStore.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class LoginStore: NSObject {
    
    static let sharedInstance = LoginStore()
    
    private override init() {
        super.init()
    }
    
    /// This function will make the login request
    ///
    /// Calls the service class function to make a post call with username and password. Receives the response containing token, if error occurs, receives the Server Error with error message.
    /// - Parameters:
    ///        - callback: A callback  with the parameters `result` having the token and `error` which is a ServerError object.
    ///        - body: Dictionary object containing email and password.
    func performLogin(_ body: Dictionary<String, String>?, callback:@escaping (_ result: String?, _ error:ServerError?) -> Void) {
        NetworkService.sharedInstance.post(withBaseURL: NetworkConstants.loginAPI, body: body) {
            (result, error) in
            if error == nil {
                if let resultDict = result as? [String: Any] {
                    if let token = resultDict["token"] as? String {
                        callback(token, nil)
                    } else if let error = resultDict["error"] as? String {
                        callback(nil, CommonUtils.sharedInstance.signInError(error))
                    }
                } else {
                    callback(nil, CommonUtils.sharedInstance.defaultError())
                }
            } else {
                callback(nil, error)
            }
        }
    }
}
