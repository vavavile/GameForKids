//
//  HomeViewController.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var games = [Game]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initiateView()
        initData()
    }
    
    private func initiateView() {
        self.title = "Home"
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
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

}

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
        return CGSize(width: 150, height: 200)
    }
}

struct Game {
    var image:String?
    var title:String?
}
