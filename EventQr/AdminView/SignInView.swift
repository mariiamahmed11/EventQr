//
//  SignInView.swift
//  EventQr
//
//  Created by user on 13/06/2023.
//

import SwiftUI
import Foundation
import FirebaseCore
import FirebaseAuth

struct SignInView: View {
    
    @State private var showingSheet = false
    @State var AdminEmail: String = ""
    @State private var password: String = ""
    @State var showingAlert = false
    
    
    var body: some View {
        
        if showingAlert == true {
            TabViews()
        } else {
            NavigationView {
                
                ZStack{
                    
//                                Image("img1")
//                                    .opacity(0.50)
                    
                    let gradient = Gradient(colors: [. black, .gray])
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing)
                        )
                        .ignoresSafeArea()
                    //.opacity(0.80)
                    
                    // NavigationView {
                    
                    VStack{
                        
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom,20)
                        Text("Sign in")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom,50)
                            .foregroundColor(.accentColor)
                        
                        TextField("Email", text: $AdminEmail)
                            .font(.body)
                            .frame(width:340,height:30)
                        //.background(Color.gray.opacity(0.10))
                            .padding(10)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor), alignment: .bottom)
                            .foregroundColor(.white)
                        
                        SecureField("Password", text: $password)
                            .font(.body)
                            .frame(width:340,height:30)
                        //.background(Color.gray.opacity(0.10))
                            .padding(10)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor), alignment: .bottom)
                            .foregroundColor(.white)
                        
                        Button( action: {
                            signIn()
                        },
                                label: {
                            Text("Sign In")
                                .bold()
                                .frame(width: 140, height: 40)
                                .foregroundColor(.black)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                                .padding()
                            
                        }
                        ).padding(.top,90)
                        
                        Button("did not have an account ?"){
                            showingSheet.toggle()
                        }
                        .foregroundColor(.accentColor)
                        .padding(.top,50)
                        
                    }
                    
                    //.navigationTitle("Sign In")
                    //.navigationBarTitleDisplayMode(.inline)
                }
            }.sheet(isPresented: $showingSheet) {
                SignUpPage()
            }
            
        }
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: AdminEmail, password: password) { _, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                //showingAlert = true
            } else {
                print("Done!!!")
                showingAlert = true
            }
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()

    }
}

