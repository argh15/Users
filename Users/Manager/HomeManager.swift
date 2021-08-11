//
//  HomeManager.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class HomeManager: NSObject {
    
    static let sharedInstance = HomeManager()
    
    private override init() {
        super.init()
    }
    
    /// This function fetches the users data from the service.
    ///
    /// Calls the store class function to fetch the users data from the API. Receives the response containing the users data, if error occurs, receives the Server Error with error message.
    /// - Parameter callback: A callback  with the parameters `result`, having the UserModel data and `error` which is a ServerError object.
    func fetchUsers(callback:@escaping (_ result: UserModel?, _ error:ServerError?) -> Void) {
        HomeStore.sharedInstance.fetchUsers() {
            (model, error) in
            if error == nil {
                callback(model, nil)
            } else {
                callback(nil, error)
            }
        }
    }
    
}
