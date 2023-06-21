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
            GenerateQr(url: """
member name : Mariam ALsuwailem ✅
eventID:052E3622-276B-4F24-ACA8-510891B45D73
Event start date : 23 jun 2023
Event End date : 24 jun 2023
""")
            
        }
    }
    
}

struct Viewqr_Previews: PreviewProvider {
    static var previews: some View {
        Viewqr()
    }
}




