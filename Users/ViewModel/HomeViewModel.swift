//
//  HomeViewModel.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class HomeViewModel {
    
    var isFetchUsersSuccess: Dynamic<Bool> = Dynamic(false)
    var usersData: [UserInfoModel]?
    var errorMessage = ""
    
    /// This function fetches the users data from the service.
    ///
    /// Calls the store class function to fetch the users data from the API.
    /// Receives the response containing the users data, if error occurs, receives the Server Error with error message.
    /// if error nil, set data to class variable and set isFetchUsersSuccess to true
    /// if error not nil, set error message and set isFetchUsersSuccess to false
    func fetchUsers() {
        HomeManager.sharedInstance.fetchUsers() { [self]
            (result, error)  in
            if error == nil {
                if let data = result?.data {
                    usersData = data
                }
                isFetchUsersSuccess.value = true
            } else {
                errorMessage = error?.errorMessage ?? StringConstants.defaultError
                isFetchUsersSuccess.value = false
            }
        }
    }
}
