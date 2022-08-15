//
//  UserDetailsViewController.swift
//  RandomUsers
//
//  Created by Torgeir Eikeland on 13/08/2022.
//

import UIKit
import SDWebImage

// UserDataDelegate would be added if delegate function worked
// class UserDetailsViewController: UIViewController, UserDataDelegate {

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderAndAgeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do things after view has loaded
        loadUserData()
    }
    
    // Loads data from current user into correct views
    func loadUserData() {
        let user = currentUser!.results[0]
        usernameLabel.text = user.login.username
        userImage.sd_setImage(with: URL(string: user.picture.large))
        
        nameLabel.text = "Name: \(user.name.first) \(user.name.last)"
        genderAndAgeLabel.text = "\(user.gender), Age: \(user.dob.age)"
        locationLabel.text = "From: \(user.location.country)"
    }
    
    /*
     Protocol funcition that would take data from ViewController and insert here
     
    func passData(user: RandomUser) {
        self.user = user
    }
    */
    
}
