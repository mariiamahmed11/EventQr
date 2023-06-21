//
//  UserViewModel.swift
//  EventQr
//
//  Created by user on 18/06/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UserViewModel : ObservableObject {
    
    var db = Firestore.firestore()
   // search the "event collection" or "member collection" where the UserEmail == user.email
    
    func UserHome() {
        db.collection("UserEvent")
            .whereField("AdminId", isEqualTo: "\(String(describing: Auth.auth().currentUser))")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        print(data["EventName"] as! String)
                    }
                }
                
            }
    }
    
}
