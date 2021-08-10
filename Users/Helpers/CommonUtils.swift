//
//  CommonUtils.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class CommonUtils: NSObject {
    
    static let sharedInstance = CommonUtils()
    
    private override init() {
        super.init()
    }
    
    func defaultError() -> ServerError {
        let error = NSError(domain: StringConstants.domain, code: 0, userInfo: nil)
        let customError = ServerError(err: error)
        return customError
    }
    
    func signInError(_ errorMessage: String) -> ServerError {
        let error = NSError(domain: StringConstants.domain, code: 1, userInfo: nil)
        let customError = ServerError(err: error, customErrorMessage: errorMessage)
        return customError
    }
}
