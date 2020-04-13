//
//  Game2Cell.swift
//  GameForKids
//
//  Created by Lê Duy on 4/13/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class Game2Cell: UICollectionViewCell {
    
    
    @IBOutlet weak var numberLb: UILabel!
    
    @IBOutlet weak var inputLb: UITextField!
    var correctNumber = -1
    var checkAnswer:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        numberLb.isHidden = true
        inputLb.isHidden = false
        
        inputLb.layer.borderColor = UIColor(rgb: 0xE28D1C).cgColor
        inputLb.layer.borderWidth = 3.5
        inputLb.layer.cornerRadius = 8
        
        inputLb.delegate = self
        setupTextFields()
    }

}

extension Game2Cell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 30)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Check answer", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        inputLb.inputAccessoryView = toolbar
    }
    @objc func doneButtonAction(){
        self.endEditing(true)
        if let checkAnswer = checkAnswer {
            checkAnswer()
        }
        
    }
}
