//
//  AdminInfoViewModel.swift
//  EventQr
//
//  Created by user on 13/06/2023.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

@MainActor class AdminViewModel : ObservableObject {
    
    
    var db = Firestore.firestore()
    
    @Published var Events = [Event]()
    
    let storage = Storage.storage()
    
    let userId = Auth.auth().currentUser?.uid
    
//    var adminId = {
//        getAdmininfo().id
//    }
//
    init() {
        getAdminEvents()
        //getAdmininfo()
            
    }

    func uploadEventimage (){
    }
    
    //fetch and read from database bring data from data base to my array
    func getAdminEvents() {
        
        db.collection("Event")
            .whereField("AdminId", isEqualTo: userId ?? "")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                // var Events = [Event]()
                
                self.Events  = documents.map { (queryDocumentSnapshot) -> Event in
                    let data = queryDocumentSnapshot.data()
                    let EventName = data["EventName"] as? String ?? ""
                    let EventLocation = data["EventLocation"] as? String ?? ""
                    let StartDate = data["StartDate"] as? Date ?? Date.now
                    let EndDate = data["EndDate"] as? Date ?? Date.now
                    let EventID = data["EventID"] as? String ?? ""
                    
                    //self.Events.append(names)
                    return Event(EventName: EventName, EventLocation: EventLocation, EventID:EventID, StartDate: StartDate, EndDate: EndDate, EventMembers: [])
                    //insert them in my strcut so i can deal with them
                }
            }
        
    }
    
    
    func addevent(EventName: String, EventLocation: String, StartDate:Date, EndDate: Date){
        let eventId = UUID().uuidString
        
        db.collection("Event").document(eventId)
        
            .setData([
                "EventName" : EventName,
                "EventLocation": EventLocation,
                "StartDate": StartDate,
                "EndDate": EndDate,
                "AdminId": userId!,
                "EventMember" : [""],
                "EventID": eventId
            ])
        {
            error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addAdmin(AdminName: String, AdminLastname: String, AdminEmail:String, AdminPhone: String, AdminAddress: String){
        
        db.collection("AdminInfo").document()
        
            .setData([
                "AdminName" : AdminName,
                "AdminLastname": AdminLastname,
                "AdminEmail": AdminEmail,
                "AdminPhone": AdminPhone,
                "AdminId": userId as Any,
                "AdminAddress" : AdminAddress,
            ])
        {
            error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func uploadImage(image:UIImage){
        
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            storage.reference().child("uu").putData(imageData, metadata:nil){
                
                (_, err) in
                if let err = err {
                    
                    print ("an error has occured -\(err.localizedDescription)")
                } else {
                    print("image uploaded successfully")
                }
            }
            
        } else {
            print ("could not unwarp/case image to data")
        }
    }
    
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    // We added a listener to check if the user is logged in or not.
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    
    //    func addmember(AdminId: String, UserEmail: String, MemberFristName:String, MemberLastName: String, UserQr: String){
    //        db.collection("Event").whereField("EventID", isEqualTo: "")
    //            .document("EventMembers")
    //            .collection("EventMember")
    //
    //            .addDocument(data: [
    //                "AdminId" : AdminId,
    //                "UserEmail": UserEmail,
    //                "MemberFristName": MemberFristName,
    //                "UserQr": UserQr
    //            ])
    //        { error in
    //            if let error = error {
    //                print(error.localizedDescription)
    //            }
    //        }
    //    }
    //
    
    func addmember(memeberEmail: String){
        db.collection("Event").document("1234")
            .updateData([
                "EventMember": FieldValue.arrayUnion([memeberEmail])
            ])
    }
    
    //fetch and read from database bring data from data base to my object
    
    func getAdmininfo(complettion: @escaping (AdminInfo) -> Void) {
       
        db.collection("AdminInfo")
            .whereField("AdminId", isEqualTo: userId ?? "")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                for document in documents {
                    let data = document.data()
                    let fristname = data["AdminName"] as! String
                    let lastname = data["AdminLastname"] as! String
                    let phone = data["AdminPhone"] as! String
                    let address = data["AdminAddress"] as! String
                    let email = data["AdminEmail"] as! String
                    
                    print ("hj\(email)")
                    
                    let adminInfo =  AdminInfo(AdminName: fristname , AdminLastname: lastname, AdminEmail: email, AdminPhone: phone, AdminAddress: address)
//                    return adminInfo
                    complettion(adminInfo)
                }
            }
        
    }
    
    // func to show all my memer in that eventid
    //func to show image in admin home
    //func to generate qr that take useremail, username , userlastname , eventid
    
    
}

