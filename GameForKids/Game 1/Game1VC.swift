//
//  Game1VC.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit
import AVFoundation

class Game1VC: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var containerView: UIView!
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var level1 = [12, 34, 67, 26, 99]
    var cleared = [Int]()
    var point = 0
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Game1ItemCell", bundle: nil), forCellWithReuseIdentifier: "Game1ItemCell")
        
        containerView.layer.cornerRadius = 20
        
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
    
    
    @IBAction func audioBtnAction(_ sender: Any) {
        playSound(soundName: "complete_chart")
        
    }
    
    private func playSound(soundName:String?) {
        guard let urt = Bundle.main.url(forResource: soundName!, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: urt, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            DispatchQueue.global().async {
                player.play()
            }
        } catch let error {
            print(error)
        }
    }
}

extension Game1VC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Game1ItemCell", for: indexPath) as! Game1ItemCell
        let currentNumber = (indexPath.row + 1)
        if level1.contains(currentNumber) {
            mysteriousNumber(cell: cell, hideInputTf: false, hideNumberLb: true, number: currentNumber)
            if cleared.contains(currentNumber) {
                cell.inputTf.text = "\(currentNumber)"
                cell.inputTf.textColor = UIColor.green
                cell.inputTf.isEnabled = false
            }
            else {
                cell.inputTf.text = ""
                cell.inputTf.textColor = UIColor.black
                cell.inputTf.isEnabled = true
            }
        }
        else {
            mysteriousNumber(cell: cell, hideInputTf: true, hideNumberLb: false, number: -1)
            cell.numberLb.text = "\(currentNumber)"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/10, height: 50)
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
                cell.inputTf.text = ""
                
                self.present(alert, animated: true)
            } else if text == "" {
                let alert = UIAlertController(title: "Please fill in the blank gaph !", message: "Try again!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Oh oke", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            } else {
                cell.inputTf.textColor = UIColor.green
                cell.inputTf.isEnabled = false
                self.point += 1
                self.cleared.append(correctNum)
                if self.point == self.level1.count {
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
