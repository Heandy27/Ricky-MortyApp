//
//  RootView.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 24/12/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        switch (appState.status) {
        case .errorApp:
            ErrorView()
        case .loading:
            LoadingView()
        case .success:
            HomeView(viewModel: HomeViewModel())
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
