//
//  CVPixelBuffer.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import CoreML

extension CVPixelBuffer {
    
    func toMLMultiArray() -> MLMultiArray? {
        
        guard let mlMultiArray = try? MLMultiArray(shape: [1, 3, 224, 224], dataType: .float32) else { return nil }

        let width = 224
        let height = 224
        let bytesPerRow = CVPixelBufferGetBytesPerRow(self)

        CVPixelBufferLockBaseAddress(self, .readOnly)
        guard let baseAddress = CVPixelBufferGetBaseAddress(self) else { return nil }

        let pixelData = baseAddress.assumingMemoryBound(to: UInt8.self)

        var offset = 0
        for c in 0..<3 {
            for y in 0..<height {
                for x in 0..<width {
                    let index = y * bytesPerRow + x * 4 + c
                    mlMultiArray[offset] = NSNumber(value: Float(pixelData[index]) / 255.0)
                    offset += 1
                }
            }
        }
        
        CVPixelBufferUnlockBaseAddress(self, .readOnly)
        return mlMultiArray
    }
}
