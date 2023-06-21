//
//  SwiftUIView.swift
//  EventQr
//
//  Created by Razan Mohammed Alzannan on 02/12/1444 AH.
//

import SwiftUI
import CodeScanner
import Foundation

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
    @State var scannedCode: String = "Scan a QR code to get started."
    
    var scanneSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
                
            }
        )
    }
    
    var body: some View {
        ZStack{
            let gradient = Gradient(colors: [. black, .gray])
            Rectangle()
                .fill(
                    LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .topTrailing)
                )
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
               Image(systemName: "doc.viewfinder.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .padding()
                Text(scannedCode)
                    .foregroundColor(.accentColor)
                
                Button("Scan OR Code"){
                    self.isPresentingScanner = true
                }.bold()
                    .frame(width: 140, height: 40)
                    .foregroundColor(.black)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding()
                    .sheet(isPresented: $isPresentingScanner){
                        self.scanneSheet
                    }
            }
        }
    }
}

struct Scan_Previews: PreviewProvider {
    static var previews: some View {
        Scan()
    }
}
