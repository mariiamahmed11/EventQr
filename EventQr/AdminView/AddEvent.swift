//
//  AddEvent.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI
import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

struct AddEvent: View {
     
    @StateObject var vm = AdminViewModel()

    @State var showDatePicker = false

    @State var EventName : String  = ""
    
    @State var EventImageState: String  = ""

    @State var EventLocation: String  = ""
    
    //@State var EventMember: String  = ""
    
    @State var StartDate : Date  = Date.now
    
    @State var EndDate : Date  = Date.now
    
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var upload_image:UIImage?
    //@State var download_image:UIImage?
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack(alignment: .leading){
                    ScrollView(.vertical){
                            
                            VStack {
                                //showing image if some image picked , or show the system image if not
                                if upload_image != nil {
                                    Image (uiImage: upload_image!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:170, height: 170)
                                } else {
                                    Image(systemName: "square.and.arrow.up.circle")
                                        .font(.system(size: 60))
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.secondary, .green)
                                        .fontWeight(.thin)
                                        .opacity(0.50)
                                        .cornerRadius(50)
                                }
                                
                            //....................
//                                if download_image != nil {
//                                    Image (uiImage: download_image!)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width:170, height: 170)
//                                } else {
//                                    Image(systemName: "square.and.arrow.up.circle")
//                                        .font(.system(size: 60))
//                                        .symbolRenderingMode(.palette)
//                                        .foregroundStyle(.secondary, .green)
//                                        .fontWeight(.thin)
//                                        .opacity(0.50)
//                                        .cornerRadius(50)
//                                }
                                
                                //..........
                                Button( action: {
                                    self.showActionSheet = true
                                }) {
                                    Text("Choose Image")
                                        .foregroundColor(.secondary.opacity(0.50))
                                        .padding(.bottom)
                                        .font(.body)
                                        .underline()
                                }
                                .actionSheet(isPresented: $showActionSheet){
                                    ActionSheet(title: Text("add event image")
                                                , message: nil , buttons: [
                                                    //button1
                                                    .default(Text("Camera"), action: {
                                                        self.showImagePicker = true
                                                        self.sourceType = .camera
                                                    }),
                                                    //button2
                                                    .default(Text("photo library"), action: {
                                                        self.showImagePicker = true
                                                        self.sourceType = .photoLibrary
                                                    }),
                                                    //button3
                                                    .cancel()
                                                    
                                                ])
                                }
                                //if the image picker selected
                                .sheet(isPresented: $showImagePicker){
                                    imagePicker(image: self.$upload_image , showImagePicker: self.$showImagePicker, sourceType: self.sourceType )
                                }

                                //Button for upload
                                Button(action:{  
                                    if let thisImage = self.upload_image{
                                        vm.uploadImage(image:  thisImage )
                                    } else {
                                        print ("could upload image - no image present")
                                    }
                                    
                                    
                                }) {
                                    Text ("Upload Image")
                                    
                                }
                                
                            }
                            
                            Spacer()
                                .padding(.bottom)
                            
                            
                            Group{  Text("Event *")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.accentColor)
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
                            
                            Group{  Text("URL Location *")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.accentColor)
                                TextField("insert google map url or any map url ..", text: $EventLocation)
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
                            
                            Group{
                                DatePicker(selection: $StartDate, in: Date.now..., displayedComponents: .date) {
                                    Text("Event Start Date *")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .foregroundColor(.accentColor)
                                }
                            }.padding(.bottom)
                            
                            Group{
                                DatePicker(selection: $EndDate, in: Date.now..., displayedComponents: .date) {
                                    Text("Event End Date *")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .foregroundColor(.accentColor)
                                }
                            }.padding(.bottom)
                            
//                        Group{
//                            Text("Event Members")
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .frame(maxWidth:.infinity,alignment:.leading)
//                                .foregroundColor(.accentColor)
//                            
//                            NavigationLink(destination: AddMember()){
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.gray).opacity(0.09)
//                                    .frame(width:50, height: 50)
//                                    .overlay{
//                                        Text("+")
//                                            .font(.title)
//                                            .foregroundColor(.accentColor)
//                                    }.frame(alignment: .leading)
//                                
//                            }.padding(.bottom)
//                        }
                        
                            Button( action: {
                                vm.addevent(EventName: EventName, EventLocation: EventLocation, StartDate: StartDate, EndDate: EndDate)
                            },
                                    label: {
                                Text("Save")
                                    .frame(width: 140, height: 40)
                                    .foregroundColor(.black)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                    .padding()
                                
                            }
                            ).padding(.top)
                        }
                        
                    }
                    .padding()
                    .padding(.all)
                    .navigationTitle(Text("Add event"))
                    .font(.title2)
                    .fontWeight(.medium)
                    
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
            }
        }
    
//    func dowloadimage() {
//        Storage.storage ().reference().child("temp").getData(maxSize: 2 * 1024 * 1024){
//            (imageData, err) in
//            if let err = err {
//                print ("an error has occurred - \(err.localizedDescription)")
//            } else {
//                if let imageData = imageData {
//                    self.download_image = UIImage (data: imageData)
//                } else {
//                    print("couldn't unwrap image data image")
//                }
//            }
//        }
//    }
        
    }


struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent()
            .environmentObject(AdminViewModel())
    }
}

