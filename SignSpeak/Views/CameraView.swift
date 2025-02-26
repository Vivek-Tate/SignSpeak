//
//  CameraView.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//
import SwiftUI

struct CameraView: View {
    
    // MARK: Stored Properties
    @StateObject private var cameraController = CameraController()

    var body: some View {
        ZStack {
            
            // Add CameraPreview to show live camera feed
            CameraPreview(session: cameraController.session)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                VStack {
                
                // Camera Control Panel
                HStack {
                    
                    Button(action: { cameraController.toggleCameraFlash() }) {
                        
                        Image(systemName: cameraController.isFlashEnabled ? "bolt.fill" : "bolt.slash")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: { cameraController.startRecording() }) {
                        Image(systemName: "record.circle")
                            .foregroundStyle(.red)
                            .font(.largeTitle)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: { cameraController.switchCamera() }) {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
                
                // American Sign Language Translated Text Section
                Text(cameraController.detectedSentence)
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
            }
        }
    }
        .onAppear { cameraController.startCameraSession() }
        .onDisappear { cameraController.stopCameraSession() }
    }
}
