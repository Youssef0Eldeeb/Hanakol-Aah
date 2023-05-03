//
//  FirestoreManager.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/05/2023.
//

import Foundation
import FirebaseFirestore

class FirestoreManager{
    static let shared = FirestoreManager()
    
    func firestoreRefernce(_ collectionReference: FCollectionReference) -> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func saveUserToFirestore(_ user: User){
        do{
            try FirestoreManager.shared.firestoreRefernce(.User).document(user.id).setData(from: user)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}


enum FCollectionReference: String{
    case User
}
