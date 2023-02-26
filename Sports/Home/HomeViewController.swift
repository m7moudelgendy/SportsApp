//
//  ViewController.swift
//  Sports
//
//  Created by ElGendy on 14/02/2023.
//

import UIKit
import Reachability

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    var urlObj = UrlData()
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    var arrSports = [Sport]()
    let reachability = try! Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()
        sportsCollectionView.delegate=self
        sportsCollectionView.dataSource=self
        
        arrSports.append(Sport(photo: UIImage(named: "footballer")!, title: "Football"))
        arrSports.append(Sport(photo: UIImage(named: "basketimg")!, title: "BasketBall"))
        arrSports.append(Sport(photo: UIImage(named: "cricketPlayer")!, title: "Cricket"))
        arrSports.append(Sport(photo: UIImage(named: "tennisplayer")!, title: "Tennis"))
    }
    override func viewWillAppear(_ animated: Bool) {
           NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
           do {
               try reachability.startNotifier()
           } catch
            {
               print("Unable to start notifier")
           }
       }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCell", for: indexPath) as! SportsCollectionViewCell
        let item =  arrSports[indexPath.row]
        //rounded cell , border & Shadow
         cell.layer.borderColor = UIColor.lightGray.cgColor
         cell.layer.borderWidth = 1
         cell.layer.cornerRadius = 12
         cell.layer.masksToBounds = true
         cell.layer.shadowOffset = CGSizeMake(6, 6)
         cell.layer.shadowColor = UIColor.white.cgColor
         cell.layer.shadowOpacity = 0.1
         cell.layer.shadowRadius = 4
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
        switch reachability.connection {
            // INternet
        case .wifi , .cellular:
            self.navigationController?.pushViewController(LeagueTableVC, animated: true)

            print("Wifi  Or cellular Connection")
 
           //UNAnvaliabe Internet
        case .unavailable , .none:
            let alert = UIAlertController(title:"No Internet !", message: "Make Sure Of Internet Connection", preferredStyle: .alert)
            
           alert.addAction(UIAlertAction(title: "Ok ", style: .default, handler: nil))
            var imgTitle = UIImageView(frame: CGRect(x: 50, y: 14, width: 32, height: 32))
            imgTitle.image = UIImage(named: "nointernet")
            alert.view.addSubview(imgTitle)
            self.present(alert, animated: true, completion: nil)
            print(" unavailable No Connection")
       }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 179, height: 229)
      }
    // check reachabilityChanged
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
 
    }
    
}
struct Sport{
    let photo : UIImage
    let title : String
}


