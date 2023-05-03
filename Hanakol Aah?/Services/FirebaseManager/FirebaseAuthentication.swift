//
//  FirebaseAuthentication.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class FirebaseAuthentication{
    static let shared = FirebaseAuthentication()
    private init(){}
    
    // MARK: - SignUp
    func signUp(userAuth: UserAuth, completion: @escaping (_ error: Error?) -> (Void)){
        Auth.auth().createUser(withEmail: userAuth.email, password: userAuth.password) { authResult, error in
            if let error = error{
                completion(error)
            }else{
                authResult?.user.sendEmailVerification(completion: { error in
                    completion(error)
                })
            }
            if authResult?.user != nil {
                let user = User(id: authResult!.user.uid, username: userAuth.username ?? userAuth.email, email: userAuth.email)
                
                FirestoreManager.shared.saveUserToFirestore(user)
                UserDefaultManager.shared.saveUserLocally(user)
            }
        }
    }
    
}
