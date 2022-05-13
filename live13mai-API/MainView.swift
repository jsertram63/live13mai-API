//
//  MainView.swift
//  live13mai-API
//
//  Created by Lunack on 13/05/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Liste", systemImage: "list.dash")
                }
            PhotoContentView()
                .tabItem {
                    Label("Photo", systemImage: "photo")
                }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
