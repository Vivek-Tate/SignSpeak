//
//  CameraController.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import AVFoundation
import SwiftUI

class CameraController: NSObject, ObservableObject {
    
    // MARK: Private Properties
    let session = AVCaptureSession()
    private var captureDevice: AVCaptureDevice?
    private var videoDeviceInput: AVCaptureDeviceInput?
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let sessionQueue = DispatchQueue(label: "com.VivekTate.SignSpeak.sessionQueue")
    private let modelController = ASLModelController()

    // MARK: Stored Properties
    @Published var isFlashEnabled: Bool = false
    @Published var detectedSentence: String = ""

    // Initalizer Method
    override init() {
        super.init()
        
        configureCameraSession()
    }
}

// MARK: Public Methods
extension CameraController {
    
    /// Starts the camera session
    func startCameraSession() {
        
        sessionQueue.async {
            if !self.session.isRunning { self.session.startRunning() }
        }
    }

    /// Stops the camera session
    func stopCameraSession() {
        
        sessionQueue.async {
            if self.session.isRunning { self.session.stopRunning() }
        }
    }
    
    /// Toggles the flash ON/OFF
    func toggleCameraFlash() {
        
        // Checks for torch available
        guard let device = captureDevice, device.hasTorch, device.position == .back else { return }
        do {
            
            try device.lockForConfiguration()
            device.torchMode = isFlashEnabled ? .off : .on
            isFlashEnabled.toggle()
            device.unlockForConfiguration()
        } catch {
            
            print("ERROR: CameraController - toggleCamerFlash() - \(error.localizedDescription)")
        }
    }
    
    /// Switches between front and back cameras
    func switchCamera() {
        
        guard let currentInput = videoDeviceInput else { return }
        
        session.beginConfiguration()
        session.removeInput(currentInput)

        let newPosition: AVCaptureDevice.Position = (currentInput.device.position == .back) ? .front : .back
        
        if let newPositionSession = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: newPosition) {
            
            do {
                
                let newDeviceInput = try AVCaptureDeviceInput(device: newPositionSession)
                if session.canAddInput(newDeviceInput) {
                    
                    session.addInput(newDeviceInput)
                    videoDeviceInput = newDeviceInput
                }
            } catch {
                
                print("ERROR: CameraController - switchCamera() - \(error.localizedDescription)")
            }
        }

        session.commitConfiguration()
    }
    
    /// Starts video recording
    func startRecording() {
        
        // TODO: Implement video recording logic
        print("SUCESS: CameraController - startRecording()")
    }
}

// MARK: CaptureVideoDataOutputSampleBufferDelegate Methods
extension CameraController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    /// Captures frames from the video stream (this is where you process ASL recognition)
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
                      let multiArrayInput = pixelBuffer.toMLMultiArray() else { return }
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let sign = self.modelController.predictASLSign(from: multiArrayInput) {
                DispatchQueue.main.async {
                    self.detectedSentence = "Detected: \(sign)"
                }
            }
        }
    }
}

// MARK: Private Methods
extension CameraController {
    
    /// Configures Camera Session
    private func configureCameraSession() {
        
        // Configure Session
        session.beginConfiguration()
        session.sessionPreset = .high

        // Set Camera Device
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            
            captureDevice = device
            do {
                
                let videoInput = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(videoInput) {
                    
                    session.addInput(videoInput)
                    videoDeviceInput = videoInput
                }
                
            } catch { print("ERROR: CameraController - configureCameraSession() - \(error.localizedDescription)") }
        }

        // Set Video Output
        if session.canAddOutput(videoDataOutput) {
            
            session.addOutput(videoDataOutput)
            videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "com.VivekTate.SignSpeak.videoOutputQueue"))
        }

        session.commitConfiguration()
    }
}
