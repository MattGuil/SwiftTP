//
//  main.swift
//  MoreOrLess
//
//  Created by Matthieu Guillemin on 10/09/2024.
//

import Foundation

func comment(attempts: Int) -> String {
    print("")
    switch attempts {
        case 1...2:
            return "Congratulations, you're very lucky!"
        case 3...5:
            return "Bravo, very good strategy, with a bit of luck..."
        case 6...10:
            return "Congratulations, good strategy :)"
        case 11...20:
            return "Good, but you can do better..."
        default:
            return "Well, at least you got it. Keep practicing!"
    }
}

func review(attempts: [Int]) -> Void {
    print("")
    print("## REVIEW ##")
    print("# Number of attempts: " + String(attempts.count))
    print("# History: ") // attempts.map { String($0) }.joined(separator: ", ")
    for (i, attempt) in attempts.enumerated() {
        print("     Attempt \(i + 1): \(attempt)")
    }
}

print("Please enter your name:")
if let name = readLine() {
    print("Hi \(name)")
    
    let answer = Int.random(in: 1...100)
    var win = false
    var attempts : [Int] = []
    
    print("Guess a number between 1 and 100:")
    while !win {
        if let input = readLine(), let attempt = Int(input) {
            if (attempts.contains(attempt)) {
                print("Warning: you already tried this value. Attempt not counted.")
            } else {
                attempts.append(attempt)
                let madBot = Int.random(in: 1...10) == 1
                if attempt < answer {
                    madBot ? print("Less") : print("More")
                } else if attempt > answer {
                    madBot ? print("More") : print("Less")
                } else {
                    win = true
                    print(comment(attempts: attempts.count))
                    review(attempts: attempts)
                }
            }
        } else {
            print("Please enter a valid number.")
        }
    }
} else {
    print("Failed to read name. Exiting game.")
}
