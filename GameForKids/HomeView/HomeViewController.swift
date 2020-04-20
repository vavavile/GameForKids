//
//  HomeViewController.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var games = [Game]()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initiateView()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func initiateView() {
        self.title = "Home"
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    
    private func initData(){
        var game1 = Game()
        game1.image = "Game1"
        game1.title = "Fill in the blanks on the chart"
        
        var game2 = Game()
        game2.image = "Game2"
        game2.title = "Count forward and backward. Level2"
        
        games = [game1,game2]
    }
    
    
    @IBAction func volumnBtnAction(_ sender: Any) {
        playSound(soundName: "counting_forward")
    }
    
    private func playSound(soundName:String?) {
        guard let url = Bundle.main.url(forResource: soundName!, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            DispatchQueue.global().async {
                player.play()
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

//MARK: - UIcollection view delegate and datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let game = games[indexPath.row]
        cell.parseData(imageName: game.image!, title: game.title!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let game1 = Game1VC(nibName: "Game1VC", bundle: nil)
            self.navigationController?.pushViewController(game1, animated: true)
        case 1:
            let game2 = Game2VC(nibName: "Game2VC", bundle: nil)
            self.navigationController?.pushViewController(game2, animated: true)
        default:
            return
        }
    }
}

struct Game {
    var image:String?
    var title:String?
}
