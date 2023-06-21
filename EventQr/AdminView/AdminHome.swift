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
    
//    init() {
//        //vm.getAdminEvents()
//        //getAdmininfo()
//        dowloadimage()
//    }


    
    var body: some View {
    
        NavigationView {
            ZStack{

                let gradient = Gradient(colors: [. gray, .black])
                Rectangle()
                    .fill(
                        LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                    .ignoresSafeArea()
                
                
                
                VStack{
                    ScrollView(.vertical){
                        Text("My Events")
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.accentColor)
                        Divider()
                            .foregroundColor(.white)
                            .padding(.bottom)
                            
                        
//                        if vm.Events.count == 0 {
//                            Text("No Event have been added yet !").font(.title3)
//                        } else {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(vm.Events){ ee in
                                    Button{
                                        selectedEvent = ee
                                    } label: {
                                        CardView(name: ee.EventName)
                                        //.frame(width: 170, height: 170)
                                            .background(.regularMaterial)
                                            .cornerRadius(25)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .sheet(item: $selectedEvent) { Selectevent in
                                ShowEvent(eventname: Selectevent.EventName, eventlocation: Selectevent.EventLocation, eventstart: Selectevent.StartDate, eventend: Selectevent.EndDate, eventiid: Selectevent.EventID)
                            }
                        //}
                        
                            NavigationLink(destination: AddEvent()) {
                                VStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray).opacity(0.5)
                                        .frame(width:100, height: 100)
                                    
                                        .overlay
                                    {
                                            Text("+")
                                                .font(.largeTitle)
                                                .foregroundColor(.accentColor)
                                }.padding(.bottom)
                                
                            }
                            
                            Spacer()
                            
                        }
                    }.padding(30)
                }
            }
        }
    }

}

struct CardView: View {
    var name: String
    @State var download_image:UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if download_image != nil {
                Image(uiImage: download_image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:50, height: 50)
                    .cornerRadius(20)
            }else{
                Image(systemName: "building.2.crop.circle")
                    .background(.tint)
                    .cornerRadius(25)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 50))
                    .padding(5)
            }

            Text(name)
                .font(.title3)
                .frame(maxWidth: .infinity)
//            Text(desc)
//                .font(.footnote)
            
        }.padding()
            .onAppear{
                //dowloadimage()
                Storage.storage().reference().child("uu").getData(maxSize: 2 * 1024 * 1024){
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
