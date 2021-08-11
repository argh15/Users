//
//  UIView.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 11/08/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    /// This function will load the image with passed `url`
    ///
    /// It will first convert the contents of url to Data form and then add the image to the current ImageView.
    /// Doing it on global queue to not block the user.
    ///
    /// - Parameter url: url for the image.
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
