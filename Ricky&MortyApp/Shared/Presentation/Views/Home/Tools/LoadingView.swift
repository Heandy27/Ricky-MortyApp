//
//  LoadingView.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 24/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image(.splashView)
                .resizable()
            Image("")
                .resizable()
                .background(.black)
                .opacity(0.2)
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.white)
                    .padding(.bottom, 5)
                Text("Cargando...")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    LoadingView()
}