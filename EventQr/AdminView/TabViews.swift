//
//  TapBar.swift
//  EventQr
//
//  Created by user on 15/06/2023.
//

import SwiftUI
import Foundation

struct TabViews: View {
    var body: some View {
            
            TabView {
                AdminHome()
                    .badge(2)
                    .tabItem {
                        Label("My Events", systemImage: "figure.equestrian.sports")
                    }
                Scan()
                    .tabItem {
                        Label("Scan QR", systemImage: "qrcode.viewfinder")
                    }
                
                AdminProfile()
                    .badge("!")
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
            }.accentColor(.accentColor)
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
