//
//  UserDefaults.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

extension UserDefaults {
    
    /// This function will set the flag for logged in state
    ///
    /// - Parameter value: Bool value for is logged in state.
    func setIsLoggedIn(_ value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    /// This function will get the flag for logged in state
    ///
    /// - Returns: Bool value for is logged in state.
    func getIsLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
