//
//  ChooseCreateMember.swift
//  EventQr
//
//  Created by user on 19/06/2023.
//

import SwiftUI

struct ChooseCreateMember: View {
    var eventid : String
    @State private var showingAlert = false
    @ObservedObject private var vmm = MemberViewModel()
    @State var selectedUser: UserInfo?
    @State var SearchContacts: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack{
                Text("Add Members")
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .foregroundColor(Color("gray1"))
                Divider()
                    .padding(.bottom)
                
                TextField("Search", text:$SearchContacts)
                    .font(.body)
                    .frame(width:200,height:20)
                    .padding(10)
                    .background(Color.gray.opacity(0.20))
                //.border(Color(UIColor.separator))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                
                List {
                    ForEach(vmm.AllMemeber){ user in
                        Button{
                            showingAlert = true
                            selectedUser = user
                            vmm.addmember(memeberEmail: user.UserEmail, docid: eventid)
                            
                        } label: {
                            Text("\(user.UserEmail)")
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("gray1"))
                            //.foregroundColor(Color("gray1"))
                                .frame(width:150, height: 30)
                                .overlay {
                                    HStack{
                                        Text("Invent")
                                            .foregroundColor(.white)
                                        Image(systemName: "person.crop.circle.badge.plus")
                                            .frame(width:50)
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                    }
                                }
                        }.alert("Email with QR enternce to this event will sent to this user", isPresented: $showingAlert) {
                            Button("Yes", role: .destructive) { }
                            Button("Cancel", role: .cancel) { }
                        }
                    }.background(Color.white)
                }.scrollContentBackground(.hidden)
                
                HStack{   Text("Add New Event Members")
                        .font(.body)
                        .fontWeight(.medium)
                    //.frame(maxWidth:.infinity,alignment:.leading)
                        .foregroundColor(Color("gray1"))
                    
                    NavigationLink(destination: AddMember()){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray).opacity(0.09)
                            .frame(width:50, height: 50)
                            .overlay{
                                Text("+")
                                    .font(.title)
                                    .foregroundColor(Color("gray1"))
                            }.frame(alignment: .leading)
                        
                    }
                }
                
                
            }.padding()
        }
    }
}

struct ChooseCreateMember_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCreateMember(eventid: "")
    }
}
