//
//  Game2VC.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class Game2VC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    

    @IBOutlet weak var collectionView: UICollectionView!
    var point = 4
    override func viewDidLoad() {
        super.viewDidLoad()

        initLayout()
        
        let start = StartScreenVC(nibName: "StartScreenVC", bundle: nil)
        self.present(start, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
    }
    
    private func initLayout(){
        containerView.layer.cornerRadius = 20
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Game2Cell", bundle: nil), forCellWithReuseIdentifier: "Game2Cell")
        collectionView.layer.cornerRadius = 8
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}


extension Game2VC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Game2Cell", for: indexPath) as! Game2Cell
        let currentNumber = (indexPath.row+1)
        switch currentNumber {
        case 6:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 6)
        case 7:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 7)
        case 9:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 9)
        case 10:
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: 10)
        default:
            mysteriousNumber(cell: cell, hideInputTf: true, hideNumberLb: false, number: -1)
            cell.numberLb.text = "\(indexPath.row + 1)"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width)/20, height: collectionView.bounds.height)
    }
    
    func mysteriousNumber(cell: Game2Cell!,hideInputTf:Bool,hideNumberLb:Bool,number:Int){
        cell.inputLb.isHidden = hideInputTf
        cell.numberLb.isHidden = hideNumberLb
        cell.correctNumber = number
        cell.checkAnswer = {
            let text = cell.inputLb.text?.trim() ?? ""
            let correctNum = cell.correctNumber
            
            if text != "" && Int(text) != correctNum {
                let alert = UIAlertController(title: "The answer is not correct", message: "Try again!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Oh oke", style: .default, handler: nil))
                cell.inputLb.textColor = UIColor.red
                
                self.present(alert, animated: true)
            } else if text == "" {
                let alert = UIAlertController(title: "Please fill in the blank gaph !", message: "Try again!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Oh oke", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            } else {
                cell.inputLb.textColor = UIColor.green
                cell.inputLb.isEnabled = false
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
