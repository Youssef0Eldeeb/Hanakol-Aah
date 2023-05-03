//
//  User.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Equatable{
    var id: String = ""
    var pushId: String = ""
    var imageLink: String = ""
    var username, email: String
}


struct UserAuth{
    var username: String?
    var email: String
    var password: String
}
