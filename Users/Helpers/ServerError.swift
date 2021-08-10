//
//  ServerError.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation
import UIKit

struct ServerError {
    
    var error:NSError?
    var errorCode: Int
    var errorMessage: String?

    init(err:NSError, customErrorMessage: String? = nil) {
        self.error = err
        self.errorCode = err.code
        self.errorMessage = err.localizedDescription
        if let customError = customErrorMessage {
            self.errorMessage = customError
        } else {
            self.setUserMessage()
        }
    }
    
    mutating func setUserMessage() {

        switch self.errorCode {
            case 0:
                self.errorMessage = StringConstants.defaultError
            case -1009:
                self.errorMessage = StringConstants.internetError
            default:
                self.errorMessage = StringConstants.defaultError
        }
    }
    
}
