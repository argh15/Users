//
//  HomeStore.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class HomeStore {
    
    let service = NetworkService()
    
    /// This function fetches the users data from the service.
    ///
    /// Calls the service class function to fetch the users data from the API. Receives the response containing the users data, if error occurs, receives the Server Error with error message.
    /// - Parameter callback: A callback  with the parameters `result`, having the UserModel data and `error` which is a ServerError object.
    func fetchUsers(callback:@escaping (_ result: UserModel?, _ error:ServerError?) -> Void) {
        service.get(withBaseURL: NetworkConstants.usersAPI) {
            (result, error) in
            let decoder = JSONDecoder()
            if error == nil {
                if let resultData = result, let decodedData = try? decoder.decode(UserModel.self, from: resultData) {
                    callback(decodedData, nil)
                } else {
                    callback(nil, CommonUtils.sharedInstance.defaultError())
                }
            } else {
                callback(nil, error)
            }
        }
    }
}
