//
//  UserDelegate.swift
//  RandomUsers
//
//  Created by Torgeir Eikeland on 13/08/2022.
//

import Foundation

protocol UserDataDelegate {
    
    //Takes data from ViewController and sends to UserDetailsViewController
    func passData(user: String)
    
}
