//
//  SwiftUIView.swift
//  EventQr
//
//  Created by Razan Mohammed Alzannan on 02/12/1444 AH.
//

import SwiftUI
import CodeScanner
import Foundation
import SPAlert

//Image(systemName: "qrcode.viewfinder")
//    .resizable()
//    .scaledToFit()
//    .frame(width:100)
//    .foregroundColor(Color.accentColor)
//    .padding(.bottom,20)
//Text("Sign in")
//    .font(.largeTitle)
//    .bold()
//    .padding(.bottom,50)
//    .foregroundColor(.accentColor)

struct Scan: View {
    
    @State var isPresentingScanner = false
    @State var showAlert2 = false
    @State var scannedCode: String = "Scan member QR code to check premssion."
    
    var scanneSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    showAlert2.toggle()
                }
                
            }
        )
    }
    
    var body: some View {
        ZStack{
                let gradient = Gradient(colors: [Color.accentColor,Color("gray3")])
                Rectangle()
                    .fill(
                        LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
                    )
                    .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Image(systemName: "doc.viewfinder.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .foregroundColor(.white)
                    .padding()
                    .padding()
                Text(scannedCode)
                    .foregroundColor(.white)
                
                Button("Scan OR Code"){
                    self.isPresentingScanner = true
                }.bold()
                    .frame(width: 140, height: 40)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    .sheet(isPresented: $isPresentingScanner){
                        self.scanneSheet
                    }
                    .SPAlert(
                        isPresent: $showAlert2,
                        title: "Authorized member",
                        message: "check the member info",
                        duration: 3.0 ,
                        dismissOnTap: false,
                        preset: .done,
                        haptic:.success,
                        layout: .init(),
                        completion: {
                            print ("This alert has been completed!")
                        }
                    )
                
            }
            
        }
    }
        
    func dd(){
        if scannedCode.contains("052E3622-276B-4F24-ACA8-510891B45D73"){
            showAlert2.toggle()
        } else {
            print("no match")
            //Text(scannedCode)
        }

    }
}

struct Scan_Previews: PreviewProvider {
    static var previews: some View {
        Scan()
    }
}

