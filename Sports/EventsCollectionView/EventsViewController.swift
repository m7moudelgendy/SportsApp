
import UIKit
import Kingfisher

class EventsViewController: UIViewController {
    
    var upcoming_Index : Int?
    var  apiUrl :String = ""
    var networkManagerObj = Networking()
    var footballArr = [FootballResults]()
    var basketCricketArr = [BasketCricketResults]()
    var tennisArr = [TennisResults]()
    var allEventsArr : [Any] = []
    var models = [SportsListItem]()
     
    @IBOutlet weak var upComingView: UICollectionView!
    @IBOutlet weak var latestResView: UICollectionView!
    @IBOutlet weak var teamsView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        
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
                    self.latestResView.reloadData()
                    self.teamsView.reloadData()
                }}, url: apiUrl)
            break
        case 1:
            networkManagerObj.fetchBasketCricketData(complition: { leagues in
                DispatchQueue.main.async {
                    self.basketCricketArr = leagues!.result
                    self.upComingView.reloadData()
                    self.latestResView.reloadData()
                    self.teamsView.reloadData()
                }
            }, url: apiUrl)
            break
        case 2:
            networkManagerObj.fetchBasketCricketData(complition: { leagues in
                DispatchQueue.main.async {
                    self.basketCricketArr = leagues!.result
                    self.upComingView.reloadData()
                    self.latestResView.reloadData()
                    self.teamsView.reloadData()
                }
            }, url: apiUrl)
            break
        case 3:
            networkManagerObj.fetchTennisData(complition: { leagues in
                DispatchQueue.main.async {
                    self.tennisArr = leagues!.result
                    self.upComingView.reloadData()
                    self.latestResView.reloadData()
                    self.teamsView.reloadData()
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
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let processor = RoundCornerImageProcessor(cornerRadius: 60)
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
            }
            switch upcoming_Index{
            case 0:
                latestCell.team1LB.text = footballArr[indexPath.row].event_home_team
                latestCell.team2LB.text = footballArr[indexPath.row].event_away_team
                latestCell.resultLB.text = footballArr[indexPath.row].event_final_result
                let homeTeamImgUrl = URL(string: footballArr[indexPath.row].home_team_logo ?? "imageNotfound")
                let awayTeamImgUrl = URL(string: footballArr[indexPath.row].away_team_logo ?? "imageNotfound")
                
                if (homeTeamImgUrl != nil) || (awayTeamImgUrl != nil) {
                    latestCell.team1Img.kf.setImage(with: homeTeamImgUrl, placeholder: UIImage(named: "placeHolder"),options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                    
                    latestCell.team2Img.kf.setImage(with: awayTeamImgUrl, placeholder: UIImage(named: "placeHolder"),options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                    
                }
                
                else{
                    latestCell.team1Img.image = UIImage(named: "placeHolder")
                }
                
                break
            case  1,2 :
                latestCell.team1LB.text = basketCricketArr[indexPath.row].event_home_team
                latestCell.team2LB.text = basketCricketArr[indexPath.row].event_away_team
                latestCell.resultLB.text = basketCricketArr[indexPath.row].event_final_result
                let homeTeamImgUrl = URL(string: basketCricketArr[indexPath.row].event_home_team_logo ?? "imageNotfound")
                let awayTeamImgUrl = URL(string: basketCricketArr[indexPath.row].event_away_team_logo ?? "imageNotfound")
                if (homeTeamImgUrl != nil) || (awayTeamImgUrl != nil) {
                    latestCell.team1Img.kf.setImage(with: homeTeamImgUrl, placeholder: UIImage(named: "placeHolder"),options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                    
                    latestCell.team2Img.kf.setImage(with: awayTeamImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                }
                else{
                    latestCell.team1Img.image = UIImage(named: "placeHolder")
                }
                
                break
            case 3:
                latestCell.team1LB.text = tennisArr[indexPath.row].event_first_player
                latestCell.team2LB.text = tennisArr[indexPath.row].event_second_player
                latestCell.resultLB.text = tennisArr[indexPath.row].event_final_result
                let firstPlayerImgUrl = URL(string: tennisArr[indexPath.row].event_first_player_logo ?? "imageNotfound")
                let secPlayerImgUrl = URL(string: tennisArr[indexPath.row].event_second_player ?? "imageNotfound")
                if (firstPlayerImgUrl != nil) || (secPlayerImgUrl != nil) {
                    latestCell.team1Img.kf.setImage(with: firstPlayerImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                    latestCell.team2Img.kf.setImage(with: secPlayerImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(5)),
                        .cacheOriginalImage
                    ], progressBlock: nil, completionHandler: nil)
                }
                
                else{
                    latestCell.team1Img.image = UIImage(named: "placeHolder")
                }
                break
            default:
                break
            }
            return latestCell
            
        }
        //hadeer
        else if collectionView == self.teamsView {
            //return cell of teams
            
            let teamsCell = teamsView.dequeueReusableCell(withReuseIdentifier: "teamsCollectionViewCell", for: indexPath) as! teamsCollectionViewCell
            teamsCell.layer.cornerRadius = 20
            if indexPath.row % 2 == 0{
                teamsCell.contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
                switch upcoming_Index{
                case 0:
                    teamsCell.teamNameLB.text = footballArr[indexPath.row].event_home_team
                    let homeTeamImgUrl = URL(string: footballArr[indexPath.row].home_team_logo ?? "imageNotfound")
                    if (homeTeamImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: homeTeamImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], completionHandler: nil)
                    }
                    
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                case  1,2 :
                    
                    teamsCell.teamNameLB.text = basketCricketArr[indexPath.row].event_home_team
                    let homeTeamImgUrl = URL(string: basketCricketArr[indexPath.row].event_home_team_logo ?? "imageNotfound")
                    if (homeTeamImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: homeTeamImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], progressBlock: nil, completionHandler: nil)
                    }
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                case 3:
                    teamsCell.teamNameLB.text = tennisArr[indexPath.row].event_first_player
                    let firstPlayerImgUrl = URL(string: tennisArr[indexPath.row].event_second_player ?? "imageNotfound")
                    if (firstPlayerImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: firstPlayerImgUrl, placeholder: UIImage(named: "placeHolder"),options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], progressBlock: nil, completionHandler: nil)
                    }
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                default:
                    break
                }
            }else {
                teamsCell.contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.25)
                
                switch upcoming_Index{
                case 0:
                    teamsCell.teamNameLB.text = footballArr[indexPath.row].event_away_team
                    let awayTeamImgUrl = URL(string: footballArr[indexPath.row].away_team_logo ?? "imageNotfound")
                    if (awayTeamImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: awayTeamImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], progressBlock: nil, completionHandler: nil)
                    }
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                case  1,2 :
                    teamsCell.teamNameLB.text = basketCricketArr[indexPath.row].event_away_team
                    let awayTeamImgUrl = URL(string: basketCricketArr[indexPath.row].event_away_team_logo ?? "imageNotfound")
                    if (awayTeamImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: awayTeamImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], progressBlock: nil, completionHandler: nil)
                    }
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                case 3:
                    teamsCell.teamNameLB.text = tennisArr[indexPath.row].event_second_player
                    let secPlayerImgUrl = URL(string: tennisArr[indexPath.row].event_second_player_logo ?? "secPalyernotfound")
                    if (secPlayerImgUrl != nil)
                    {
                        teamsCell.teamImg.kf.setImage(with: secPlayerImgUrl, placeholder: UIImage(named: "placeHolder"), options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(5)),
                            .cacheOriginalImage
                        ], progressBlock: nil, completionHandler: nil)
                    }
                    else{
                        teamsCell.teamImg.image = UIImage(named: "placeHolder")
                    }
                    break
                default:
                    break
                }
            }
            
            return teamsCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.teamsView
        {
            let DetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            //       DetailsVC.apiUrl = urlObj.eventsFootballLeagueApiURL
            
            switch upcoming_Index
            {
                
            case 0:
             
                DetailsVC.sportKey = 0
             
 
                    if indexPath.row % 2 == 0
                    {
                        
                        DetailsVC.teamID = footballArr[indexPath.row].home_team_key ?? 1
                        print("Football Home Details View")
                        DetailsVC.favTeamName =  footballArr[indexPath.row].event_home_team ?? "nil"
                        
                    }
                    else
                    {
                        DetailsVC.teamID = footballArr[indexPath.row].away_team_key ?? 1
                        print("Football  Away Details View")
                        DetailsVC.favTeamName =  footballArr[indexPath.row].event_away_team ?? "nil"
                        
                    }
                    self.navigationController?.pushViewController(DetailsVC, animated: true)
                 
 
               case 1 , 2 :
                DetailsVC.sportKey = 1
 
                    
                    if indexPath.row % 2 == 0
                    {
                        DetailsVC.teamID = basketCricketArr[indexPath.row].home_team_key ?? 1
                        print("Football Home Details View")
                        DetailsVC.favTeamName =  basketCricketArr[indexPath.row].event_home_team ?? "nil"
                        DetailsVC.basketCricketTeamName =  basketCricketArr[indexPath.row].event_home_team ?? "nil"

                        
                    }
                    else
                    {
                        DetailsVC.teamID = basketCricketArr[indexPath.row].away_team_key ?? 1
                        print("Football  Away Details View")
                        DetailsVC.favTeamName =  basketCricketArr[indexPath.row].event_away_team ?? "nil"
                        DetailsVC.basketCricketTeamName =  basketCricketArr[indexPath.row].event_away_team ?? "nil"
                    }
                    
 
            //    DetailsVC.basketCricketTeamName = DetailsVC.teamNameLabel.
                 self.navigationController?.pushViewController(DetailsVC, animated: true)
                break


               
                case 3 :
                     
                    break
                    
                default:
                    break
                }
                     //      case 1:
                      //           DetailsVC.teamID = urlObj.EventsBasketballLeagueApiURL
                //                DetailsVC.upcoming_Index = sportKey
                //                print("Basket Details View")
                //                break
                //            case 2:
                //                DetailsVC.teamID = urlObj.EventsCricketLeagueApiURL
                //                DetailsVC.upcoming_Index = sportKey
                //                print("Cricket Details View")
                //                break
                //            case 3:
                //                DetailsVC.teamID = urlObj.EventsTennisLeagueApiURL
                //                DetailsVC.upcoming_Index = sportKey
                //                print("Tennis Details View")
            
            }
            
            
        }
        
    }
 
