//
//  ShowEvent .swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

struct ShowEvent: View {
    
    
    var eventname : String
    var eventlocation : String
    var eventstart : Date
    var eventend : Date
    var eventiid : String
    
    var body: some View {
        @State var download_image:UIImage?
        
        NavigationView {
            ZStack{
                VStack(){
                    ScrollView(.vertical){
                    
                        Group{
                            if download_image != nil {
                                Image(uiImage: download_image!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:50, height: 50)
                            }else{
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
                                .foregroundColor(.accentColor)
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
                                .foregroundColor(.accentColor)
                            Text("\(eventlocation)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                        }.padding(.bottom)
                        
                        Group{

                                Text("Event Start Date")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.accentColor)
                            Text("\(eventstart)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                                       
                        }.padding(.bottom)
                        Group{
                            
                                Text("Event End Date")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.accentColor)
                            Text("\(eventend)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.gray)
                                       
                        }.padding(.bottom)
//for each for all member
                        Group{
//                            Text("Event Members")
//                                //.foregroundColor(.accentColor)
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .frame(maxWidth:.infinity,alignment:.leading)
                            
                            HStack{
                                
                                NavigationLink(destination: ShowMember()){
                                    Image(systemName: "person.circle")
                                        .font(.system(size: 40))
                                        .foregroundColor(.secondary)
                                        .fontWeight(.thin)
                                    Text("mariam")
                                }
                                NavigationLink(destination: ChooseCreateMember(eventid: eventiid)){
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.gray).opacity(0.09)
                                        .frame(width:50, height: 50)
                                        .overlay{
                                            Text("+")
                                                .font(.title)
                                                .foregroundColor(.accentColor)
                                        }.frame(alignment: .leading)
                                    
                                }
                            }
                        }.padding(.bottom)
                        
                        Button( action: {},
                                label: {
                            Text("save")
                                .frame(width: 140, height: 40)
                                .foregroundColor(.black)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                                .padding()
                            
                        }
                                
                        )
                        
                    }
                    
                }
                .padding()
                .padding(.all)
                .navigationTitle(Text("Home/Event name"))
                   .font(.title2)
                   .fontWeight(.medium)
                  
                .navigationBarTitleDisplayMode(.inline)
                
                
                
            }
        }
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
    
}

struct ShowEvent_Previews: PreviewProvider {
    static var previews: some View {
        ShowEvent(eventname: "", eventlocation: "", eventstart: Date.now, eventend: Date.now, eventiid: "")
    }
}
