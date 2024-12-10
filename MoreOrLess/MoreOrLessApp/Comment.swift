//
//  Comment.swift
//  MoreOrLessApp
//
//  Created by Matthieu Guillemin on 24/09/2024.
//

import Foundation

public func generateComment(attempts: Int, language: String) -> String {
    switch language {
        case "Français":
            switch attempts {
                case 1...2:
                    return "Félicitations, vous avez beaucoup de chance !"
                case 3...5:
                    return "Bravo, très bonne stratégie, avec un peu de chance..."
                case 6...10:
                    return "Félicitations, bonne stratégie :)"
                case 11...20:
                    return "Bien, mais vous pouvez faire mieux..."
                default:
                    return "Bon, au moins vous avez réussi. Continuez à pratiquer !"
            }
        case "Perse":
            switch attempts {
                case 1...2:
                    return "تبریک! خیلی خوش شانس هستید!"
                case 3...5:
                    return "آفرین، استراتژی خیلی خوب، با کمی شانس..."
                case 6...10:
                    return "تبریک! استراتژی خوبی داشتید :)"
                case 11...20:
                    return "خوب بود، اما می‌توانید بهتر عمل کنید..."
                default:
                    return "خب، حداقل درست حدس زدید. به تمرین ادامه دهید!"
            }
        default:
            return "Congratulations, you're very lucky!" // Default to English if something goes wrong
    }
}

/*
public func generateComment(attempts: Int) -> String {
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
*/
