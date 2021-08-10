//
//  AlertView.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import UIKit

class AlertView: UIViewController {
    static let sharedInstance = AlertView()
    
    var window = UIApplication.shared.windows.first { $0.isKeyWindow }
    
    func showAlert(header: String, message: String, actionTitle: String) {
        
        var topViewController = self.window?.rootViewController
        while topViewController?.presentedViewController != nil
        {
            topViewController = topViewController?.presentedViewController
        }
        
        let alertController = UIAlertController(title: header, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(action)
        
        topViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
}
