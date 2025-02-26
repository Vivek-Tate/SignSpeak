//
//  MLMultiArray.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import CoreML

extension MLMultiArray {
    
    /// Convert ML Multi Array to Array
    func toArray() -> [Float] {
        
        // Stored Properties
        let count = self.count
        var array = [Float](repeating: 0, count: count)
        
        for i in 0..<count { array[i] = self[i].floatValue }
        return array
    }
}
