//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Matthieu Guillemin on 01/10/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myInputDisplayLabel : UILabel!
    @IBOutlet weak var stackLine1: UILabel!
    @IBOutlet weak var stackLine2: UILabel!
    @IBOutlet weak var stackLine3: UILabel!
    @IBOutlet weak var stackLine4: UILabel!
    @IBOutlet weak var stackLine5: UILabel!
    
    var myStack: StackRPN! = StackRPN()
    
    var containsPoint = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myInputDisplayLabel.text = ""
        stackLine1.text = ""
        stackLine2.text = ""
        stackLine3.text = ""
        stackLine4.text = ""
        stackLine5.text = ""
    }
    
    func displayStack() {
        myStack.display()
        if let element1 = myStack.getElementWith(aShift: 0) {
            stackLine1.text = String(describing: element1)
        } else {
            stackLine1.text = " "
        }
        
        if let element2 = myStack.getElementWith(aShift: 1) {
            stackLine2.text = String(describing: element2)
        } else {
            stackLine2.text = " "
        }
        
        if let element3 = myStack.getElementWith(aShift: 2) {
            stackLine3.text = String(describing: element3)
        } else {
            stackLine3.text = " "
        }
        
        if let element4 = myStack.getElementWith(aShift: 3) {
            stackLine4.text = String(describing: element4)
        } else {
            stackLine4.text = " "
        }
        
        if let element5 = myStack.getElementWith(aShift: 4) {
            stackLine5.text = String(describing: element5)
        } else {
            stackLine5.text = " "
        }
    }

    @IBAction func clickPoint(_ sender: Any) {
        if (!containsPoint) {
            myInputDisplayLabel.text! += "."
            containsPoint = true
        }
    }
    
    @IBAction func clickMul(_ sender: Any) {
        guard let b = myStack.pop(),
              let a = myStack.pop()
        else {
            print("Erreur : Impossible de récupérer des valeurs depuis la pile")
            return
        }

        let result = a.doubleValue * b.doubleValue

        myStack.push(n: NSNumber(value: result))
        
        displayStack()
    }
    
    @IBAction func clickDiv(_ sender: Any) {
        guard let b = myStack.pop(),
              let a = myStack.pop()
        else {
            print("Erreur : Impossible de récupérer des valeurs depuis la pile")
            return
        }

        let result = a.doubleValue / b.doubleValue

        myStack.push(n: NSNumber(value: result))
        
        displayStack()
    }
    
    @IBAction func clickMinus(_ sender: Any) {
        guard let b = myStack.pop(),
              let a = myStack.pop()
        else {
            print("Erreur : Impossible de récupérer des valeurs depuis la pile")
            return
        }

        let result = a.doubleValue - b.doubleValue

        myStack.push(n: NSNumber(value: result))
        
        displayStack()
    }
    
    @IBAction func clickAdd(_ sender: Any) {
        guard let b = myStack.pop(),
              let a = myStack.pop()
        else {
            print("Erreur : Impossible de récupérer des valeurs depuis la pile")
            return
        }

        let result = a.doubleValue + b.doubleValue

        myStack.push(n: NSNumber(value: result))
        
        displayStack()
    }
    
    @IBAction func clickDrop(_ sender: Any) {
        if let poppedNumber = myStack.pop() {
            displayStack()
        }
    }
    
    @IBAction func clickEnter(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 6
        numberFormatter.decimalSeparator = "."
        
        let numberToPush = numberFormatter.number(from: myInputDisplayLabel.text!)!
        
        myStack.push(n: numberToPush)
        myInputDisplayLabel.text = ""
        containsPoint = false
        displayStack()
    }
    
    @IBAction func clickDigit(_ sender: UIButton) {
        myInputDisplayLabel.text! += String(sender.tag)
    }
}
