//
//  UIViewController.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// This function will return the id of the View Controller
    ///
    /// - Returns: String ID
    static var identifier: String {
        return String(describing: self)
    }

    /// This function will hide the soft-keyboard when tapped on the View Controller
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// This function will hide the soft-keyboard when editing is finished
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
