//
//  ViewController.swift
//  Sports
//
//  Created by ElGendy on 14/02/2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    var arrSports = [Sport]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsCollectionView.delegate=self
        sportsCollectionView.dataSource=self
        
        arrSports.append(Sport(photo: UIImage(named: "sports")!, title: "Football"))
        arrSports.append(Sport(photo: UIImage(named: "sports")!, title: "Basketball"))
        arrSports.append(Sport(photo: UIImage(named: "sports")!, title: "Cricket"))
        arrSports.append(Sport(photo: UIImage(named: "sports")!, title: "Tennis"))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCollectionViewCell
        let item =  arrSports[indexPath.row]
        cell.setCell(photo: item.photo , title: item.title)
        return cell
    }
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }*/

}
struct Sport{
    let photo : UIImage
    let title : String
}


