//
//  Game1ItemCell.swift
//  GameForKids
//
//  Created by Lê Duy on 4/12/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class Game1ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var inputTf: UITextField!
    @IBOutlet weak var numberLb: UILabel!
    
    var correctNumber = -1
    var checkAnswer:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code.
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.5
        
        inputTf.layer.borderColor = UIColor(rgb: 0xE28D1C).cgColor
        inputTf.layer.borderWidth = 4.5
        inputTf.layer.cornerRadius = 10
        
        inputTf.delegate = self
        setupTextFields()
    }
}


extension Game1ItemCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 30)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Check answer", style: .done, target: self, action: #selector(doneButtonAction))
        let cancelBtnx = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelBtn))
        toolbar.setItems([flexSpace,cancelBtnx, doneBtn], animated: false)
        toolbar.sizeToFit()
        inputTf.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction(){
        self.endEditing(true)
        if let checkAnswer = checkAnswer {
            checkAnswer()
        }
    
    }
    
    @objc func cancelBtn(){
        self.endEditing(true)
    }
}
