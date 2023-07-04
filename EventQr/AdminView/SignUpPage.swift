//
//  SignUpPage.swift
//  EventQr
//
//  Created by user on 18/06/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


struct SignUpPage: View {
   // @State var showingAlert = false
    
    var body: some View {
//        if showingAlert == true {
//            TabViews()
//        } else {
            ZStack{
                ScrollView {
                    VStack{
                        ExtractedView()
                        
                    }
                    //.padding()
                }.padding(.top)
                
                
            }
      //  }
    }
    }

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}

struct ExtractedView: View {
    @ObservedObject private var vm = AdminViewModel()
    
    
    @State var email = ""
    @State var fristName = ""
    @State var LastName = ""
    @State var phone = ""
    @State var address = ""
    @State var password = ""
    
    
    var body: some View {
            
            VStack{
                Text("Create Accont")
                              .bold()
                              .foregroundColor(.accentColor)
                              .font(.title2)
                              .padding(.bottom)
                              .padding(.bottom)
                Group {
                    Text("Email *")
                        .padding(.trailing , 280)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title3)
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .foregroundColor(.gray)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                        .padding()
                    Text("Frist Name *")
                        .padding(.trailing , 260)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title3)
                    TextField("", text: $fristName)
                        .foregroundColor(.gray)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                        .padding()
                }
                Text("Last Name *")
                    .padding(.trailing , 260)
                    .foregroundColor(.accentColor)
                    .bold()
                    .font(.title3)
                TextField("", text: $LastName)
                    .foregroundColor(.gray)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.bottom)
                    .padding()
                Text("Mobile *")
                    .padding(.trailing , 280)
                    .foregroundColor(.accentColor)
                    .bold()
                    .font(.title3)
                TextField("", text: $phone)
                    .foregroundColor(.gray)
                    .keyboardType(.phonePad)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 10)
                    .padding()
                Text("Address *")
                    .padding(.trailing , 240)
                    .foregroundColor(.accentColor)
                    .bold()
                    .font(.title3)
                TextField("", text: $address)
                    .foregroundColor(.gray)
                    //.keyboardType(.)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.bottom)
                    .padding()
                VStack{
                    Text("password *")
                        .padding(.trailing , 260)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title3)
                    SecureField("", text: $password)
                        .foregroundColor(.gray)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .padding(.bottom)
                        .padding()
                }
                Button(action: {
                    signUp(completion: {
                        vm.addAdmin(AdminName: fristName, AdminLastname: LastName, AdminEmail: email, AdminPhone: phone, AdminAddress: address)
                    })
                }) {
                    Text("Register ")
                        .bold()
                        .frame(width: 140, height: 40)
                        .foregroundColor(.black)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding()
                }
                .padding()
            }
        
    }
    
    func signUp(completion: @escaping () -> Void){
        try? Auth.auth().signOut()
            
        
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            print("gggg")
            
            if errors != nil {
                print(errors!.localizedDescription )
                print("no errror in signup")
                
            } else {
                print(re!.description)
                //showingAlert = true
                completion()
            }
        }
    }

}

