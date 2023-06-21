//
//  AdminProfile.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI

struct AdminProfile: View {

    @StateObject private var vm = AdminViewModel()
//    let adminInfo = AdminInfo(AdminName: "q", AdminLastname: "", AdminEmail: "", AdminPhone: "", AdminAddress: "")
    @State var gg: AdminInfo = AdminInfo(AdminName: "mariam" , AdminLastname: "alsuwailem", AdminEmail: "mariam14@hotmail.com", AdminPhone: "0538131432", AdminAddress: "ksa, riyadh")
    
    var body: some View {
        NavigationView {
            ZStack{
                
                VStack{
                    ScrollView(.vertical){
                        
                        Text("Profile")
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Divider()
                            .padding(.bottom,15)
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Image(systemName: "pencil")
                                .cornerRadius(0.90)
                                .font(.body)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.accentColor, lineWidth: 3)
                                        )
                                
                            
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing,1)
                        Group{  Text("Frist Name")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text(gg.AdminName)
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,20)
                        }
                        Group{
                            Text("Last Name")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text(gg.AdminLastname)
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,30)
                        }
                        Group{
                            Text("Email")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text(gg.AdminEmail)
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,30)
                        }
                        Group{
                            Text("Password")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text("")
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,30)
                        }
                        Group{
                            Text("Phone Number")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text(gg.AdminPhone)
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,30)
                        }
                        Group{
                            Text("Address")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.accentColor)
                                .overlay( Divider()
                                    .frame(maxWidth: .infinity, maxHeight:1)
                                    .background(Color.accentColor), alignment: .bottom)
                                .foregroundColor(.gray)
                            Text(gg.AdminAddress)
                                .font(.title3)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.secondary)
                                .padding(0.3)
                                .padding(.leading,20)
                                .padding(.bottom,30)
                        }
                        
                        Button( action: {
                            //signIn()
                        },
                                label: {
                            Text("Save")
                                .bold()
                                .frame(width: 140, height: 40)
                                .foregroundColor(.black)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                                .padding()
                            
                        }
                        ).padding(.top)
                       
                        
                    }
                } .padding(30)
//
            }
        }.onAppear(){
            // @State var adminInfo = vm.getAdmininfo()
            vm.getAdmininfo { data in
               self.gg = data
            }
        }
    }
}

struct AdminProfile_Previews: PreviewProvider {
    static var previews: some View {
        AdminProfile()
    }
}
