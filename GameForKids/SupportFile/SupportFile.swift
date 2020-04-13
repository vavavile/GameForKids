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
