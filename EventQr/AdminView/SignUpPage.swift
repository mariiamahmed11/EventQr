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
                let gradient = Gradient(colors: [. black, .gray])
                Rectangle()
                    .fill(
                        LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing)
                    )
                
                    .ignoresSafeArea()
                //            Text("Create Accont")
                //                .bold()
                //                .foregroundColor(.accentColor)
                //                .font(.title)
                //                .padding(.bottom)
                ScrollView {
                    VStack{
                        ExtractedView()
                        
                    }
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
                Group {
                    Text("Email *")
                        .padding(.trailing , 280)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title3)
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 0.8)
                        )
                        .padding(.bottom)
                        .padding()
                    Text("Frist Name *")
                        .padding(.trailing , 260)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title3)
                    TextField("", text: $fristName)
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 0.8)
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
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.green, lineWidth: 0.8)
                    )
                    .padding(.bottom)
                    .padding()
                Text("Mobile *")
                    .padding(.trailing , 280)
                    .foregroundColor(.accentColor)
                    .bold()
                    .font(.title3)
                TextField("", text: $phone)
                    .foregroundColor(.white)
                    .keyboardType(.phonePad)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.green, lineWidth: 0.8)
                    )
                    .padding(.bottom, 10)
                    .padding()
                Text("Address *")
                    .padding(.trailing , 240)
                    .foregroundColor(.accentColor)
                    .bold()
                    .font(.title3)
                TextField("", text: $address)
                    .foregroundColor(.white)
                    //.keyboardType(.)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.green, lineWidth: 0.8)
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
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 0.8)
                        )
                        .padding(.bottom)
                        .padding()
                }
                Button(action: {
                    signUp()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                        vm.addAdmin(AdminName: fristName, AdminLastname: LastName, AdminEmail: email, AdminPhone: phone, AdminAddress: address)}
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
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            if errors != nil{
                print(errors!.localizedDescription )
            } else {
                print(re!.description)
                signUp()
                //showingAlert = true
            }
        }
    }

}

