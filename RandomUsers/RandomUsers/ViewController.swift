//
//  ViewController.swift
//  RandomUsers
//
//  Created by Torgeir Eikeland on 13/08/2022.
//

import UIKit
import SDWebImage

// Global variable for sending data to next view
// Segue didnt want to send data and caused errors so this is current fix
// Sending data with protocol was also attempted
var currentUser: RandomUser? = nil


class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    //Tried sending data with protocol but view is not loaded yet and doesnt work
    var delegate: UserDataDelegate?
    
    var randomUserService: RandomUserService = RandomUserService()
    
    var userList: [RandomUser] = []{
        didSet{
            // if data change reload table view with the new data
            userTableView.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch data from api and load to tableview with didSet
        getUsers()

        //Initial tableView settup
        userTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    //Gets rid of old users and loads new ones
    @IBAction func refreshButton(_ sender: Any) {
        userList = []
        getUsers()
    }
    
    //Tries to fetch 5 users loads those found
    func getUsers() {
        for _ in 1...5 {
            randomUserService.getData { user in
                self.userList.append(user)
            }
        }
    }
    
    
    
    
    /* Sending data to label causing fatal error
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? UserDetailsViewController, let selectedIndex = self.userTableView.indexPathForSelectedRow?.row
        else {
            return
        }
    }
     */
}


// Table view extensions

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        let user = userList[indexPath.row].results[0]
        cell.nameLabel?.text = "\(user.login.username)"
        cell.ageLabel?.text = "Age: \(user.dob.age)"
        cell.userImageView.sd_setImage(with: URL(string: user.picture.large))
        return cell
    }
}

// Handle cell selection
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        currentUser = userList[indexPath.row]
        
        // delegate?.passData(user: userList[indexPath.row])
    }
}
