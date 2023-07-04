//
//  AddMember.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI

struct AddMember: View {
    var body: some View {
        @State var EventName : String = ""
        @State var expired = Date.now
        @State var showDatePicker = false
        
        //NavigationView {
        ZStack{
            VStack(alignment: .leading){
                ScrollView(.vertical){
                    
                    Group{
                        Image(systemName:"person.circle")
                            .font(.system(size: 100))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.secondary,Color.accentColor)
                            .fontWeight(.thin)
                        //.opacity(0.50)
                        Button( action: {}, label: {
                            
                            Text("upload Memeber image")
                                .foregroundColor(.secondary.opacity(0.50))
                                .padding(.bottom)
                                .font(.body)
                                .underline()
                        })
                    }
                    Spacer()
                        .padding(.bottom)
                    
                    
                    Group{  Text("Frist Name *")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        TextField("Member Frist Name", text: $EventName)
                            .font(.body)
                            .frame(width:330,height:30)
                        //.background(Color.gray.opacity(0.10))
                            .padding(.horizontal)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor).opacity(0.30), alignment: .bottom)
                        
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                    Spacer()
                        .padding(.bottom)
                    
                    
                    Group{  Text("Last Name *")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        TextField("Member Last Name", text: $EventName)
                            .font(.body)
                            .frame(width:330,height:30)
                            .padding(.horizontal)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor.opacity(0.30)), alignment: .bottom)
                        
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                    Spacer()
                        .padding(.bottom)
                    
                    Group{  Text("Email *")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        TextField("Member Email", text: $EventName)
                            .font(.body)
                            .frame(width:330,height:30)
                            .padding(.horizontal)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor.opacity(0.30)), alignment: .bottom)
                        
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                        .padding(.bottom)
                    
                    Group{  Text("Phone")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        TextField("Member Phone", text: $EventName)
                            .font(.body)
                            .frame(width:330,height:30)
                            .padding(.horizontal)
                            .overlay( Divider()
                                .frame(maxWidth: .infinity, maxHeight:1)
                                .background(Color.accentColor.opacity(0.30)), alignment: .bottom)
                        
                            .foregroundColor(.gray)
                            .padding(.bottom)
                        
                        Text("Enternce Qr")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth:.infinity,alignment:.leading)
                            .foregroundColor(Color("gray1"))
                        
                        Button( action: {
                        }, label:{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray).opacity(0.09)
                                .frame(width:90, height: 90)
                                .overlay{
                                    Image(systemName:"qrcode")
                                        .foregroundColor(.green)
                                        .font(.system(size: 50))
                                        .fontWeight(.thin)
                                }
                        }).frame(alignment: .leading)
                        
                    }.padding(.bottom)
                    
                    VStack{
                        Button( action: {
                            //signIn()
                        },
                                label: {
                            Text("Save")
                                .frame(width: 140, height: 40)
                                .foregroundColor(.black)
                                .background(Color("gray1"))
                                .cornerRadius(10)
                                .padding()
                            
                        }
                        )
                        //                            Text("By click save, your event member info will be saved and their enternce QR will generated and sent to the memeber email and app.")
                        //                                    .foregroundColor(.secondary.opacity(0.50))
                        //                                    .padding(.bottom)
                        //                                    .font(.body)
                        //                                    .underline()
                        
                        
                    } .padding(.top)
                }
                
            }
            .padding()
            .padding(.all)
            //.navigationTitle(Text("create new Member user"))
            .font(.title2)
            .fontWeight(.medium)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
            
            
        }
    }
}
//}

struct AddMember_Previews: PreviewProvider {
    static var previews: some View {
        AddMember()
    }
}
