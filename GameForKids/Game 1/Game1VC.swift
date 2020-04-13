//
//  Game1VC.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class Game1VC: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var point = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Game1ItemCell", bundle: nil), forCellWithReuseIdentifier: "Game1ItemCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}

extension Game1VC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Game1ItemCell", for: indexPath) as! Game1ItemCell
        let currentNumber = (indexPath.row + 1)
        switch currentNumber {
        case 12:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 12)
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
            
        case 34:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 34)
            
        case 67:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 67)
        case 26:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 26)
        case 99:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 99)
        default:
            mysteriousNumber(cell: cell, hideInputTf: true, hideNumberLb: false, number: -1)
            cell.numberLb.text = "\(indexPath.row + 1)"
        }
        cell.mainView = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth - 80)/12, height: 50)
    }
    
    func mysteriousNumber(cell: Game1ItemCell!,hideInputTf:Bool,hideNumberLb:Bool,number:Int){
        cell.inputTf.isHidden = hideInputTf
        cell.numberLb.isHidden = hideNumberLb
        cell.correctNumber = number
        cell.checkAnswer = {
            let text = cell.inputTf.text?.trim() ?? ""
            let correctNum = cell.correctNumber
            
            if text != "" && Int(text) != correctNum {
                let alert = UIAlertController(title: "The answer is not correct", message: "Try again!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Oh oke", style: .default, handler: nil))
                cell.inputTf.textColor = UIColor.red
                
                self.present(alert, animated: true)
            } else if text == "" {
                let alert = UIAlertController(title: "Please fill in the blank gaph !", message: "Try again!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Oh oke", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            } else {
                cell.inputTf.textColor = UIColor.green
                cell.inputTf.isEnabled = false
                self.point -= 1
                if self.point == 0 {
                    let alert = UIAlertController(title: "Congratulation !!?", message: "You had finished the game.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Bravo :)", style: .default, handler: { _ in
                        self.navigationController?.popViewController(animated: true)
                        
                    }))
                    self.present(alert, animated: true)
                }
            }
            
        }
    }
}
