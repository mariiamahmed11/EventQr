//
//  ShowEvent .swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

struct ShowEvent: View {
    @EnvironmentObject var vm : AdminViewModel
    var eventname : String
    var eventlocation : String
    var eventstart : Date
    var eventend : Date
    var members :[String]
    @State var eventiid : String
    @State var download_image:UIImage?
    @State var selectedMember  = ""
    
    var body: some View {
       
        NavigationView {
            ZStack{
                VStack(){
                    ScrollView(.vertical){
                    
                        Group{
                            if download_image != nil {
                                Image(uiImage: download_image!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:130, height: 130)
                                    .shadow(color:.gray ,radius: 5)
                                    .padding()
                            } else {
                                Image(systemName:"photo")
                                    .font(.system(size: 90))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.thin)
                            }

                        }.padding(.bottom)
                        
                        Group{ Text("Event Name")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(Color("gray1"))
                            Text("\(eventname)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)

                        }.padding(.bottom)
                        
                        Group{  Text("URL Location")
                                .font(.title3)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(Color("gray1"))
                            Text("\(eventlocation)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                        }.padding(.bottom)
                        
                        Group{
                            HStack{
                                Image(systemName: "calendar.badge.clock")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("gray1"))
                                Text("Event Start Date")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color("gray1"))
                            }
                            Text("\(eventstart)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                                       
                        }.padding(.bottom)
                        Group{
                            HStack{
                                Image(systemName: "calendar.badge.clock")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("gray1"))
                                Text("Event End Date")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color("gray1"))
                                
                            }
                            Text("\(eventend)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                                       
                        }.padding(.bottom)
//for each for all member
//                        List{
//                            ForEach(members,id: id.self){ ee in
//                                Button{
//                                    selectedMember = ee
//                                } label: {
//                                    Text("\(ee)")
//                                }
//                            }
//                        }
//                        .sheet(item: $selectedMember) { Selectm in
//                            ShowEvent(eventname: Selectevent.EventName, eventlocation: Selectevent.EventLocation, eventstart: Selectevent.StartDate, eventend: Selectevent.EndDate, members:Selectevent.EventMember, eventiid: Selectevent.EventID )
//                        }

                        Group{
                                Text("Event Memeber")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color("gray1"))
                            //Text("\(members)")
//                            Text(String("\(members)"))
//                                    .font(.body)
//                                    .fontWeight(.medium)
//                                    .frame(maxWidth: .infinity,alignment: .leading)
//                                    .foregroundColor(Color.gray)
//
//                            List {
//                                ForEach(vm.AllMemebers){ user1 in
//                                    NavigationLink(destination: ShowMember()){
//                                        Image(systemName: "person.circle")
//                                            .font(.system(size: 40))
//                                            .foregroundColor(.secondary)
//                                            .fontWeight(.thin)
//                                        Text("\(user1.MemberEmail)")
//                                    }
//                                }.background(Color.white)
//                            }.scrollContentBackground(.hidden)
                            
                        }.padding(.bottom)
                        Group{
//                            Text("Event Members")
//                                //.foregroundColor(.accentColor)
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .frame(maxWidth:.infinity,alignment:.leading)
                            
                            VStack{                               
                                NavigationLink(destination: ChooseCreateMember(eventid: eventiid)){
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.gray).opacity(0.09)
                                        .frame(width:50, height: 50)
                                        .overlay{
                                            Text("+")
                                                .font(.title)
                                                .foregroundColor(Color("gray1"))
                                        }.frame(alignment: .leading)
                                }
                                NavigationLink(destination: ShowMember()){
                                    Image(systemName: "person.circle")
                                        .font(.system(size: 40))
                                        .foregroundColor(.secondary)
                                        .fontWeight(.thin)
                                    Text("mariam")
                                        .foregroundColor(Color("gray1"))
                                    
                                }
                                
                            }
                        }.padding(.bottom)
//                            .onAppear{
//                                vm.getallmember()
//                            }
                        
//                        Button( action: {},
//                                label: {
//                            Text("save")
//                                .frame(width: 140, height: 40)
//                                .foregroundColor(.black)
//                                .background(Color.accentColor)
//                                .cornerRadius(10)
//                                .padding()
//
//                        }
//
//                        )
                        
                   }
                    
                }
                .padding()
                .padding(.all)
                //.navigationTitle(Text("Home/Event name"))
                   .font(.title2)
                   .fontWeight(.medium)
                .navigationBarTitleDisplayMode(.inline)

                
            }
        }
        .onAppear{
            //dowloadimage()
            Storage.storage().reference().child("\(eventiid)").getData(maxSize: 2 * 1024 * 1024){
                (imageData, err) in
                if let err = err {
                    print ("an error has occurred-\(err.localizedDescription)")
                } else {
                    if let imageData = imageData {
                       download_image = UIImage(data: imageData)
                    } else {
                        print("couldn't unwrap image data image")
                    }
                }
            }
        }
    }
    
}

struct ShowEvent_Previews: PreviewProvider {
    static var previews: some View {
        ShowEvent(eventname: "", eventlocation: "", eventstart: Date.now, eventend: Date.now, members: [], eventiid: "")
            .environmentObject(AdminViewModel())
    }
}
