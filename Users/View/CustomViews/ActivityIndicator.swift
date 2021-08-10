//
//  ActivityIndicator.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation
import UIKit

class ActivityIndicator: UIView {
    
    static let sharedInstance = ActivityIndicator()
    
    private var activityView: UIActivityIndicatorView?
    
    func showActivityIndicator(_ superView: UIViewController) {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = superView.view.center
        superView.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}
