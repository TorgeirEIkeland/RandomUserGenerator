//
//  UserData.swift
//  RandomUsers
//
//  Created by Torgeir Eikeland on 13/08/2022.
//

import Foundation

// MARK: - RandomUser
struct RandomUser: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable {
    let name: String
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Login
struct Login: Codable {
    let uuid, username: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
