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

    override func viewDidLoad() {
        super.viewDidLoad()

        initLayout()
    }
    
    private func initLayout(){
        containerView.layer.cornerRadius = 20
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}
