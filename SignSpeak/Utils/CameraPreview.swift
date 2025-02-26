//
//  CameraPreview.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import SwiftUI
import AVFoundation

struct CameraPreview  {
    
    // MARK: Properties
    let session: AVCaptureSession
    
    class VideoPreviewView: UIView {
        
        var previewLayer: AVCaptureVideoPreviewLayer { return layer as! AVCaptureVideoPreviewLayer }
        override class var layerClass: AnyClass { AVCaptureVideoPreviewLayer.self }
    }

}

// MARK: UIViewRepresentable Methods
extension CameraPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> VideoPreviewView {
        
        // MARK: Stored Properties
        let view = VideoPreviewView()
        
        // Configure Preview Layer
        view.previewLayer.session = session
        view.previewLayer.videoGravity = .resizeAspectFill
        
        return view
    }

    func updateUIView(_ uiView: VideoPreviewView, context: Context) {}

}
