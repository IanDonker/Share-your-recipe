//
//  User.swift
//  Share your recipe
//
//  Created by Ian Donker on 10/08/2021.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var firstName = ""
    var lastName = ""
    var email = ""
 
}
