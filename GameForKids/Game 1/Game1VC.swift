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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Game1ItemCell", bundle: nil), forCellWithReuseIdentifier: "Game1ItemCell")
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
        switch indexPath.row {
        case 12:
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
            
        case 34:
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
        case 67:
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
        case 26:
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
        case 99:
            cell.inputTf.isHidden = false
            cell.numberLb.isHidden = true
        default:
            cell.inputTf.isHidden = true
            cell.numberLb.isHidden = false
            cell.numberLb.text = "\(indexPath.row + 1)"
        }
        cell.mainView = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth - 80)/12, height: 50)
    }
}
