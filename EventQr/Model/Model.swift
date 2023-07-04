//
//  AdminInfoModel.swift
//  EventQr
//
//  Created by user on 13/06/2023.
//

import Foundation

struct AdminInfo : Identifiable, Codable {
    
    var id = UUID().uuidString

    let AdminName: String

    let AdminLastname: String

    let AdminEmail: String

    let AdminPhone: String
    
    let AdminAddress: String

}


struct Event : Identifiable, Codable {
    
    var id = UUID().uuidString

    var EventName: String

    var EventLocation: String
    
    var EventID: String
    
    var StartDate: Date
    
    var EndDate: Date
    
    var EventMember : [String]
    
}

struct EventMember : Identifiable, Codable {
    
    var id = UUID()
    
    var MemberPhone : String
    
    var MemberFristName : String
    
    var MemberLastName : String

    var MemberEmail: String

}

struct UserInfo : Identifiable, Codable {
    
    var id = UUID().uuidString

    var UserName: String

    var UserLastname: String

    var UserEmail: String

    var UserPhone: Int
    

}
