//
//  ViewController.swift
//  Sports
//
//  Created by ElGendy on 14/02/2023.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    var urlObj = UrlData()
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
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.setCell(photo: item.photo , title: item.title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let LeagueTableVC = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController

        switch indexPath.row{
        case 0:
            LeagueTableVC.title = "Football League"
            print("Football League")
            LeagueTableVC.apiUrl  = urlObj.footballLeague
            LeagueTableVC.sportKey = 0
             break
        case 1:
            LeagueTableVC.title = "BasketBall League"
            LeagueTableVC.apiUrl   = urlObj.basketLeague
            print("BasketBall League")
            LeagueTableVC.sportKey = 1
            break
        case 2:
            LeagueTableVC.apiUrl   = urlObj.cricketLeague
            LeagueTableVC.title = "Cricket League"
            LeagueTableVC.apiUrl   = urlObj.cricketLeague
            print("Cricket League")
            LeagueTableVC.sportKey = 2
              break
        case 3:
            LeagueTableVC.title = "Tennis League"
            LeagueTableVC.apiUrl  = urlObj.tennisLeague
            print("Tennis League")
            LeagueTableVC.sportKey = 3
            break
        default:
            break
        }
        LeagueTableVC.tableView.reloadData()

        self.navigationController?.pushViewController(LeagueTableVC, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 179, height: 229)
     //   let size = (collectionView.frame.size.width-10)/4
      //     return CGSize(width: size, height: size)
    }

}
struct Sport{
    let photo : UIImage
    let title : String
}


