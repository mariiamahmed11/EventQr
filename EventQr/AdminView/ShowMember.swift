//
//  ShowMember.swift
//  EventQr
//
//  Created by user on 20/06/2023.
//

import SwiftUI

struct ShowMember: View {
    
    @State var name : String = "Mariam"
    @State var lastname : String = "Ahmed"
    @State var email : String = "Mariam11@hotmail.com"
    @State var phone : String = "+699 53 813 1432"
    @State var address : String = "ksa, Riyadh"
    
    
    var body: some View {
        ZStack{
            VStack(){
                ScrollView(.vertical){
                    
                    Group{
                        Image(systemName: "person.circle")
                            .font(.system(size: 90))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color("gray1"))
                            .fontWeight(.thin)
                    }.padding(.bottom)
                    
                    Group{ Text("Name")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        Text("\(name)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                    }.padding(.bottom)
                    
                    Group{  Text("Last name")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        Text("\(lastname)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                    }.padding(.bottom)
                    
                    Group{
                        
                        Text("Email")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        Text("\(email)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                    }.padding(.bottom)
                    
                    Group{
                        Text("Phone")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        Text("\(phone)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                    }.padding(.bottom)
                    
                    Group{
                        Text("address")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color("gray1"))
                        Text("\(address)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                    }.padding(.bottom)
                    
                    Group{
                        Image("new")
                        //                            .font(.system(size: 90))
                        //                            .symbolRenderingMode(.palette)
                        //                            .foregroundStyle(.secondary)
                        //                            .fontWeight(.thin)
                            .resizable()
                            .frame(width: 140, height: 140)
                    }.padding(.bottom)
                    
                }
                .padding()
                .padding(.all)
                .navigationTitle(Text("Member"))
                .font(.title2)
                .fontWeight(.medium)
                
                .navigationBarTitleDisplayMode(.inline)
                
                
                
            }
        }
    }
}

struct ShowMember_Previews: PreviewProvider {
    static var previews: some View {
        ShowMember()
    }
}

