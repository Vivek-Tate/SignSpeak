//
//  CameraControlsView.swift
//  SignSpeak
//
//  Created by Vivek Tate on 27-02-2025.
//

import SwiftUI

struct CameraControlsView: View {
    
    var onRecord: () -> Void
    var onFlashToggle: () -> Void
    var onSwitchCamera: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            // Translucent Rounded Rectangle Background
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
                .frame(height: 100)
                .overlay(
                    HStack(spacing: 40) {
                        
                        // Flash Toggle Button
                        Button(action: onFlashToggle) {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(.white)
                                .padding()
                                .background(Circle().fill(Color.black.opacity(0.6)))
                                .shadow(radius: 4)
                        }
                        
                        // Centered Record Button
                        Button(action: onRecord) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 72, height: 72)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black.opacity(0.2), lineWidth: 2)
                                    )
                            }
                            .shadow(radius: 6)
                        }
                        
                        // Switch Camera Button
                        Button(action: onSwitchCamera) {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .font(.system(size: 22))
                                .foregroundStyle(.white)
                                .padding()
                                .background(Circle().fill(Color.black.opacity(0.6)))
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.horizontal, 20)
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
        }
    }
}
