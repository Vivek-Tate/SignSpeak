//
//  CameraView.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    // MARK: Private Properties
    @StateObject private var cameraController = CameraController()
    @State private var zoomLevel: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            
            // Live Camera Preview
            CameraPreview(session: cameraController.session)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(zoomLevel)
            
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
                
                // Zoom Control Buttons
                HStack {
                    Button(action: {
                        setZoomLevel(1.0)
                    }) {
                        Text("1x")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(zoomLevel == 1.0 ? .yellow : .white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    }
                    
                    Button(action: {
                        setZoomLevel(2.0)
                    }) {
                        Text("2x")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(zoomLevel == 2.0 ? .yellow : .white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    }
                }
                .padding(.bottom, 10)


                // Camera Controls (Floating Action Buttons)
                CameraControlsView(
                    onRecord: { cameraController.startRecording() },
                    onFlashToggle: { cameraController.toggleCameraFlash() },
                    onSwitchCamera: { cameraController.switchCamera() }
                )
                .padding(.bottom, 10)
            }
            .padding()
        }
        .onAppear {
            cameraController.startCameraSession()
        }
    }
}

// MARK: Private Methods
extension CameraView {
    
    /// Function to set camera zoom level
    private func setZoomLevel(_ level: CGFloat) {
        cameraController.setZoom(level)
        zoomLevel = level
    }
}
