//
//  Ricky_MortyAppApp.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 23/12/24.
//

import SwiftUI

@main
struct Ricky_MortyAppApp: App {
    
    var appState = AppStateVM()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(AppStateVM())
        }
    }
}
