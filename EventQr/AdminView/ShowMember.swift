//
//  ShowMember.swift
//  EventQr
//
//  Created by user on 20/06/2023.
//

import SwiftUI

struct ShowMember: View {
    
    @State var name : String = ""
    @State var lastname : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var address : String = ""
    
    
    var body: some View {
        ZStack{
            VStack(){
                ScrollView(.vertical){
                    
                    Group{
                        Image(systemName: "person.circle")
                            .font(.system(size: 90))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.secondary)
                            .fontWeight(.thin)
                    }.padding(.bottom)
                    
                    Group{ Text("Name")
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.accentColor)
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
                            .foregroundColor(.accentColor)
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
                            .foregroundColor(.accentColor)
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
                            .foregroundColor(.accentColor)
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
                            .foregroundColor(.accentColor)
                        Text("\(address)")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color.gray)
                        
                    }.padding(.bottom)
                    
                    Group{
                        Image("qr")
//                            .font(.system(size: 90))
//                            .symbolRenderingMode(.palette)
//                            .foregroundStyle(.secondary)
//                            .fontWeight(.thin)
                            .resizable()
                            .frame(width: 100, height: 100)
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

