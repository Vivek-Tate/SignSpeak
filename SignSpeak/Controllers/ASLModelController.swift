//
//  ASLModelController.swift
//  SignSpeak
//
//  Created by Vivek Tate on 26-02-2025.
//

import Foundation
import CoreML

class ASLModelController {
    
    // MARK: Stored Properties
    private let model: ASLModel
    private let modelClasses: [String] = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3",
        "4", "5", "6", "7", "8", "9"
    ]
    
    // MARK: Initalizer Methods
    init() {
        
        // Load CoreML model
        do { self.model = try ASLModel(configuration: MLModelConfiguration()) }
        catch { fatalError("ERROR: ASLModelController - init(): \(error)") }
    }
}

// MARK: Public Methods
extension ASLModelController {
    
    /// Predict ASL Sign
    func predictASLSign(from multiArray: MLMultiArray) -> String? {
        
        do {
            let prediction = try model.prediction(x_1: multiArray)
            let outputArray = prediction.var_822
            
            let maxIndex = getHighestProbabilityIndex(from: outputArray)
            
            guard maxIndex >= 0, maxIndex < modelClasses.count else {
                
                print("ERROR: ASLModelController - predictASLSign(): Model output index \(maxIndex) is out of range!")
                return nil
            }
            return modelClasses[maxIndex]
            
        } catch {
            
            print("ERROR: ASLModelController - predictASLSign(): \(error)")
            return nil
        }
    }
}


// MARK: Private Methods
extension ASLModelController {
    
    private func getHighestProbabilityIndex(from mlArray: MLMultiArray) -> Int {
        
        let floatValues = mlArray.toArray()
        return floatValues.indices.max(by: { floatValues[$0] < floatValues[$1] }) ?? 0
    }
}
