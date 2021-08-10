//
//  LoginManager.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class LoginManager: NSObject {
    
    static let sharedInstance = LoginManager()
    
    private override init() {
        super.init()
    }
    
    func performLogin(_ body: Dictionary<String, String>?, callback:@escaping (_ result:String?, _ error:ServerError?) -> Void) {
        LoginStore.sharedInstance.performLogin(body) {
            (result, error) in
            if error == nil {
                callback(result,nil)
            } else {
                callback(nil, error)
            }
        }
    }
}
