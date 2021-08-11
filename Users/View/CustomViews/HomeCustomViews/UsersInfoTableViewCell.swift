//
//  UsersInfoTableViewCell.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 11/08/21.
//

import UIKit

class UsersInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyTheme()
    }
    
    /// This function will set the respective data
    ///
    /// - Parameters:
    ///     - imageURL: image url
    ///     - fName: first name
    ///     - lName: last name
    ///     - email: email
    func setData(_ imageURL: URL, _ fName: String, _ lName: String, _ email: String) {
        avatarImage.load(url: imageURL)
        firstNameLabel.text = fName
        lastNameLabel.text = lName
        emailLabel.text = email
    }
    
    /// This function will apply theme to the view
    func applyTheme() {
        cardView.layer.shadowRadius = 4
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
        cardView.layer.cornerRadius = 10.0
        avatarImage.layer.cornerRadius = avatarImage.bounds.height/2
    }
    
}
