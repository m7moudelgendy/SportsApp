 
import UIKit

class EventsViewController: UIViewController {

    var upcoming_Index : Int?
    var  apiUrl :String = ""
    var networkManagerObj = Networking()
    var footballArr = [FootballResults]()
    var basketCricketArr = [BasketCricketResults]()
    var tennisArr = [TennisResults]()
    var allEventsArr : [Any] = []

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
        switch upcoming_Index{
        case 0:
            networkManagerObj.fetchFootballData(complition: { leagues in
                DispatchQueue.main.async {
                    self.footballArr = leagues!.result
                    self.upComingView.reloadData()
                }}, url: apiUrl)
            break
        case 1:
            networkManagerObj.fetchBasketCricketData(complition: { leagues in
                DispatchQueue.main.async {
                    self.basketCricketArr = leagues!.result
                    self.upComingView.reloadData()
                }
            }, url: apiUrl)
            break
        case 2:
            networkManagerObj.fetchBasketCricketData(complition: { leagues in
                DispatchQueue.main.async {
                    self.basketCricketArr = leagues!.result
                    self.upComingView.reloadData()
                }
            }, url: apiUrl)
            break
        case 3:
            networkManagerObj.fetchTennisData(complition: { leagues in
                DispatchQueue.main.async {
                    self.tennisArr = leagues!.result
                    self.upComingView.reloadData()
                }
            }, url: apiUrl)
            break
        default:
            break
        }
    }

}

extension EventsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.upComingView {
            return CGSize(width: 280, height: 150)
        } else if collectionView == self.latestResView{
            return CGSize(width: 300, height: 150)
        }else{
            return CGSize(width: 150, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.upComingView {
            //return array.count which contain upcoming events for sport
            switch upcoming_Index{
            case 0:
                allEventsArr = footballArr
                break
            case 1:
                allEventsArr = basketCricketArr
                break
            case 2:
                allEventsArr = basketCricketArr
                break
            case 3:
                allEventsArr = tennisArr
                break
            default:
                break
            }
            return allEventsArr.count
            
        } else if collectionView == self.latestResView {
            //return array.count which contain latest result for sport
            return 10
        } else{
            //return array.count which contain teams of this leagues
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.upComingView {
            //return cell of upcoming events
//mahmoud
            let upComingCell = upComingView.dequeueReusableCell(withReuseIdentifier: "upComingCollectionViewCell", for: indexPath) as! upComingCollectionViewCell
            //upComingCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                upComingCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            }else {
                upComingCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
            }
            switch upcoming_Index{
            case 0:
                upComingCell.configureCellFootball(Event: footballArr[indexPath.row])
                break
            case 1:
                upComingCell.configureCellBasketCricket(BasketEvent: basketCricketArr[indexPath.row])
                break
            case 2:
                upComingCell.configureCellBasketCricket(BasketEvent: basketCricketArr[indexPath.row])
                break
            case 3:
                upComingCell.configureCellTennis(TennisEvent: tennisArr[indexPath.row])
                break
            default:
                break
            }
            
            
            return upComingCell
            
//afnan
        }else if collectionView == self.latestResView {
            //return cell of latest result
            let latestCell = latestResView.dequeueReusableCell(withReuseIdentifier: "latestResCollectionViewCell", for: indexPath) as! latestResCollectionViewCell
            latestCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                latestCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
            }else {
                latestCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
                
                latestCell.team1LB.text = "Ay 7aga"
                latestCell.team2LB.text = "Ay 7aga tani"
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
