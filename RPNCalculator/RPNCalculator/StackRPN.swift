//
//  StackRPN.swift
//  RPNCalculator
//
//  Created by Matthieu Guillemin on 01/10/2024.
//

import Foundation

class StackRPN {
    var myArray :[NSNumber] = []
    
    func push(n: NSNumber) {
        self.myArray.append(n)
        print("Add number: \(n)")
    }
    
    func pop() -> NSNumber? {
        if let lastElement = self.myArray.last {
            self.myArray.removeLast()
            return lastElement
        }
        return nil
    }
    
    func clear() {
        self.myArray.removeAll()
    }
    
    func getElementWith(aShift: Int) -> NSNumber? {
        if (aShift < myArray.count) {
            return myArray[myArray.count - 1 - aShift]
        } else {
            return nil
        }
    }
    
    func display() {
        print("Contenu de la pile :")
        print("[ ", terminator: " ")
        for num in myArray {
            print(num, terminator: " ")
        }
        print(" ]")
    }
}
