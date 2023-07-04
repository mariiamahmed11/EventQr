//
//  AdminHome.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

struct AdminHome: View {
    @StateObject private var vm = AdminViewModel()
    @State var selectedEvent: Event?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
        //Use this if NavigationBarTitle is with displayMode = .inline
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
    }
    var body: some View {
        
        NavigationView {
            ZStack{
                
                VStack{
                    ScrollView(.vertical){
                        
                        Divider()
                            .padding(.bottom)
                        
                        
                        //                        if vm.Events.count == 0 {
                        //                            Text("No Event have been added yet !").font(.title3)
                        //                        } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.Events){ ee in
                                Button{
                                    selectedEvent = ee
                                } label: {
                                    CardView(name: ee.EventName, eventtid: ee.EventID)
                                }
                            }
                        }
                        .sheet(item: $selectedEvent) { Selectevent in
                            ShowEvent(eventname: Selectevent.EventName, eventlocation: Selectevent.EventLocation, eventstart: Selectevent.StartDate, eventend: Selectevent.EndDate, members:Selectevent.EventMember, eventiid: Selectevent.EventID)
                        }
                        //}
                        
                    }.padding()
                }
                .navigationTitle(Text("My Event"))
                .navigationBarItems(
                    trailing: Button(action: {}, label: {
                        NavigationLink(destination: AddEvent()) {
                            VStack{
                                Text("+")
                                    .font(.title)
                                    .foregroundColor(.accentColor)
                            }.padding(.bottom)
                        }
                    })
                )
            }
        }
    }
}

struct CardView: View {
    var name: String
    @State var download_image:UIImage?
    @State var eventtid: String
    
    var body: some View {
        VStack(alignment: .center) {
            
            if download_image != nil {
                Image(uiImage: download_image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:60, height: 60)
                    .cornerRadius(5)
            } else {
                Image(systemName: "building.2.crop.circle")
                //.background(.tint)
                    .cornerRadius(5)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 50))
                    .padding(5)
            }
            
            Text(name)
                .font(.title3)
                .frame(maxWidth: .infinity)
            
        }.padding()
            .onAppear{
                //dowloadimage()
                Storage.storage().reference().child("\(eventtid)").getData(maxSize: 2 * 1024 * 1024){
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
            .background(Color.gray.opacity(0.25))
            .opacity(10)
            .cornerRadius(15)
            .foregroundColor(.primary)
        
    }
    
    //    func dowloadimage() {
    //
    //        Storage.storage().reference().child ("uu").getData(maxSize: 2 * 1024 * 1024){
    //            (imageData, err) in
    //            if let err = err {
    //                print ("an error has occurred-\(err.localizedDescription)")
    //            } else {
    //                if let imageData = imageData {
    //                   download_image = UIImage (data: imageData)
    //                } else {
    //                    print("couldn't unwrap image data image")
    //                }
    //            }
    //        }
    //    }
    
}

struct AdminHome_Previews: PreviewProvider {
    static var previews: some View {
        AdminHome()
    }
}
