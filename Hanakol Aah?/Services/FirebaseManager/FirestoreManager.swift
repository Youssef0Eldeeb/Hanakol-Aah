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
    
    func downloadUserFromFirestore(userId: String){
        firestoreRefernce(.User).document(userId).getDocument { document, error in
            guard let userDocument = document else{
                return
            }
            
            let result = Result{
                try? userDocument.data(as: User.self)
            }
            switch result{
            case .success(let userObject):
                if let user = userObject{
                    UserDefaultManager.shared.saveUserLocally(user)
                }else{
                    print("\n No Document Found")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}


enum FCollectionReference: String{
    case User
}
