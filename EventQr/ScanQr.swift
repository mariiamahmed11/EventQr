//
//  ScanQr.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct GenerateQr: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url: String
    
    var body: some View {
        Image(uiImage: generateQRCodeImage(url))
            .interpolation(.none)
            .resizable ()
            . frame(width: 150, height: 150, alignment: .center)
    }
    
    func generateQRCodeImage(_ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue (data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage (qrCodeImage, from: qrCodeImage.extent){
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        
        return UIImage(systemName:"xmark") ?? UIImage()
        
    }
}

struct Viewqr : View {
    var body : some View{
        VStack{
            //Text("..")
            GenerateQr(url:"""
            Name : Mariam Alsuwailem
            Event : Swift Demo
            Strat Date: 22 / 7 / 2023
            End Date : 23 / 7 / 2030
            
            """)
            
        }
    }
    
}

struct Viewqr_Previews: PreviewProvider {
    static var previews: some View {
        Viewqr()
    }
}




