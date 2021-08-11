//
//  UIView.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 11/08/21.
//

import Foundation
import UIKit

extension UIView {
    
    /// This function will return the id of the view
    ///
    /// - Returns: String ID
    static var identifier: String {
        return String(describing: self)
    }

    /// This function will return the nib name of the view
    ///
    /// - Returns: nib name
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
