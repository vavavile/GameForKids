//
//  SupportFile.swift
//  GameForKids
//
//  Created by Lê Duy on 4/13/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import Foundation
import UIKit
extension UIAlertController {
    func presentAlertCheckAnswer(view:UIViewController?, titleAlert:String,messageAlert:String?, yesTitle:String?,noTitle:String?){
        let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        if let titleYes = yesTitle {
            alert.addAction(UIAlertAction(title: titleYes, style: .default, handler: nil))
        }
        if let view = view {
            view.present(alert, animated: true)
        }
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
