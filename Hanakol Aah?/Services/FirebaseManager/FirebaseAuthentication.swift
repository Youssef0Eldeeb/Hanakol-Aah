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
    // MARK: - Login
    func login(userAuth: UserAuth, completion: @escaping (_ error: Error?,_ isEmailVerified: Bool) -> (Void)){
        Auth.auth().signIn(withEmail: userAuth.email, password: userAuth.password) { authResult, error in
            if error == nil && authResult!.user.isEmailVerified{
                completion(error, true)
                FirestoreManager.shared.downloadUserFromFirestore(userId: authResult!.user.uid)
            }else{
                completion(error, false)
            }
        }
    }
    func resetPassword(email: String, completion: @escaping (_ error: Error?) -> (Void)){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
}
