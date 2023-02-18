//
//  splitViewController.swift
//  Sports
//
//  Created by Hader on 17/2/23.
//

import UIKit

class splitViewController: UIViewController {

    @IBOutlet weak var upComingView: UICollectionView!
    @IBOutlet weak var latestResView: UICollectionView!
    @IBOutlet weak var teamsView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upComingView.delegate = self
        upComingView.dataSource = self
        latestResView.delegate = self
        latestResView.dataSource = self
        teamsView.delegate = self
        teamsView.dataSource = self
    }

}

extension splitViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.upComingView {
            return CGSize(width: 280, height: 150)
        } else if collectionView == self.latestResView{
            return CGSize(width: 300, height: 150)
        }else if collectionView == self.teamsView{
            return CGSize(width: 150, height: 150)
        }
        return CGSize(width: 280, height: 150)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.upComingView {
            //return array.count which contain upcoming events for sport
            return 18
        } else if collectionView == self.latestResView {
            //return array.count which contain latest result for sport
            return 10
        } else if collectionView == self.teamsView {
            //return array.count which contain teams of this leagues
            return 9
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.upComingView {
            //return cell of upcoming events

            let upComingCell = upComingView.dequeueReusableCell(withReuseIdentifier: "upComingCollectionViewCell", for: indexPath) as! upComingCollectionViewCell
            upComingCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                upComingCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            }else {
                upComingCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
            }
            return upComingCell
            
        }else if collectionView == self.latestResView {
            //return cell of latest result
            let latestCell = latestResView.dequeueReusableCell(withReuseIdentifier: "latestResCollectionViewCell", for: indexPath) as! latestResCollectionViewCell
            latestCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                latestCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            }else {
                latestCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
            }
            return latestCell
            
        } else if collectionView == self.teamsView {
            //return cell of teams
            let teamsCell = teamsView.dequeueReusableCell(withReuseIdentifier: "teamsCollectionViewCell", for: indexPath) as! teamsCollectionViewCell
            teamsCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                teamsCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            }else {
                teamsCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
            }
            return teamsCell
        }
        return UICollectionViewCell()
    }
    
    
    
    
}
