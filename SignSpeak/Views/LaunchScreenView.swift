//
//  LaunchScreenView.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("SignSpeak")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                
        }
    }
}

#Preview {
    LaunchScreenView()
}
