//
//  User.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation

struct User: Codable, Equatable{
    var id: String = ""
    var pushId: String = ""
    var imageLink: String = ""
    var name, email, status: String
}


struct UserAuth{
    var username: String?
    var email: String
    var password: String
}
