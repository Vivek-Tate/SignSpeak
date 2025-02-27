//
//  CameraView.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject private var cameraController = CameraController()
    
    var body: some View {
        ZStack {
            
            // Live Camera Preview
            CameraPreview(session: cameraController.session)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                // Detected Sign Language Text Display
                HStack {
                    Text(cameraController.detectedSentence)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 16)
                
                // Camera Controls (Floating Action Buttons)
                CameraControlsView(
                    onRecord: { cameraController.startRecording() },
                    onFlashToggle: { cameraController.toggleCameraFlash() },
                    onSwitchCamera: { cameraController.switchCamera() }
                )
                .padding(.bottom, 30)
            }
            .padding()
        }
        .onAppear {
            cameraController.startCameraSession()
        }
    }
}
