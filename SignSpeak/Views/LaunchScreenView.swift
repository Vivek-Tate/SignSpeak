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
            Image("SignSpeak-Banner")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LaunchScreenView()
}
