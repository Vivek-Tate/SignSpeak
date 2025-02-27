//
//  SignSpeakApp.swift
//  SignSpeak
//
//  Created by Vivek Tate on 23-02-2025.
//

import SwiftUI

@main
struct SignSpeakApp: App {
    
    @State private var showLaunchScreen = true
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { withAnimation { showLaunchScreen = false }}
                    }
            } else {
                CameraView()
            }
        }
    }
}
