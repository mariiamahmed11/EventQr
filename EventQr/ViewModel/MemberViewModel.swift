//
//  MemberViewModel.swift
//  EventQr
//
//  Created by user on 19/06/2023.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth


class MemberViewModel : ObservableObject {
    
    var db = Firestore.firestore()
    
    @Published var AllMemeber = [UserInfo]()
    
    init() {
        getallusers()
    }
    
    func getallusers() {
        db.collection("Users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.AllMemeber  = documents.map { (queryDocumentSnapshot) -> UserInfo in
                let data = queryDocumentSnapshot.data()
                let UserName = data["UserName"] as? String ?? ""
                let UserLastname = data["UserLastname"] as? String ?? ""
                let UserEmail = data["UserEmail"] as? String ?? ""
                let UserPhone = data["UserPhone"] as? Int ?? 0
                // self.classesname.append(names)
                return UserInfo( UserName: UserName, UserLastname: UserLastname, UserEmail: UserEmail , UserPhone: UserPhone)
            }
        }
        
    }
    
//    func geteventmember() {
//        db.collection("Event").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//            
//            self.AllMemeber  = documents.map { (queryDocumentSnapshot) -> UserInfo in
//                let data = queryDocumentSnapshot.data()
//                let UserName = data["UserName"] as? String ?? ""
//                let UserLastname = data["UserLastname"] as? String ?? ""
//                let UserEmail = data["UserEmail"] as? String ?? ""
//                let UserPhone = data["UserPhone"] as? Int ?? 0
//                // self.classesname.append(names)
//                return UserInfo( UserName: UserName, UserLastname: UserLastname, UserEmail: UserEmail , UserPhone: UserPhone)
//            }
//        }
//        
//    }
  
    func addmember(memeberEmail: String, docid: String){
        db.collection("Event").document(docid)
            .updateData([
                "EventMember": FieldValue.arrayUnion([memeberEmail])
            ])
    }
    
    
}
