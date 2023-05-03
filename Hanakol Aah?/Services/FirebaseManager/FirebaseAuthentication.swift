//
//  FirebaseAuthentication.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation
import FirebaseAuth

class FirebaseAuthentication{
    static let shared = FirebaseAuthentication()
    private init(){}
    
    func signUp(userAuth: UserAuth, completion: @escaping (_ error: Error?) -> (Void)){
        Auth.auth().createUser(withEmail: userAuth.email, password: userAuth.password) { authResult, error in
            if let error = error{
                completion(error)
            }else{
                authResult?.user.sendEmailVerification(completion: { error in
                    completion(error)
                })
            }
        }
    }
}
