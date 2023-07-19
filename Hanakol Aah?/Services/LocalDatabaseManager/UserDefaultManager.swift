//
//  UserDefaultManager.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation

class UserDefaultManager{
    static let shared = UserDefaultManager()
    
    let userDefault = UserDefaults.standard
    
    func saveUserLocally(_ user: User){
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user){
            userDefault.set(data, forKey: KCurrentUser)
        }
    }
}
