  
import UIKit
 
class DetailsViewController:UIViewController,UITableViewDataSource,UITableViewDelegate  {
    func color(_ rgbColor: Int) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
            blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
 //Favourite Function
    @IBAction func favouriteBtn(_ sender: Any) {
            }
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var teamNameLabel: UILabel!
    var  apiUrl :String = ""
    var  teamID :Int = 0
    var networkManagerObj = Networking()
        var playersArr : [Player] = []
     override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.delegate = self
        detailsTable.dataSource = self
 
         networkManagerObj.fetchFootballTeamsData (complition: {teams in
            DispatchQueue.main.async { [self] in
                playersArr = teams!.result[0].players
                 self.detailsTable.reloadData()
                 guard (teams?.result) != nil else {return}
                self.detailsTable.reloadData()
                /// fetch team  name & logo
                teamNameLabel.text = teams?.result[0].team_name
                        let teamImgUrl = URL(string: teams?.result[0].team_logo ?? "imageNotfound")
                
                               if (teamImgUrl != nil)  {
                                   teamLogo.kf.setImage(with: teamImgUrl, placeholder: UIImage(named: "1"), options: nil, progressBlock: nil, completionHandler: nil)
                
                               }
                               else{
                                   teamLogo.image = UIImage(named: "3")
                               }
            }
            
        } , teamKey: teamID)
         
        self.detailsTable.reloadData()
     }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            
            return playersArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text =  playersArr[indexPath.row].player_name
            cell.detailTextLabel?.text = playersArr[indexPath.row].player_number
            let playerImgUrl = URL(string: playersArr[indexPath.row].player_image ?? "imageNotfound")
           
                   if (playerImgUrl != nil)  {
                       cell.imageView?.kf.setImage(with: playerImgUrl, placeholder: UIImage(named: "1"), options: nil, progressBlock: nil, completionHandler: nil)
           
                   }
                   else{
                       cell.imageView?.image = UIImage(named: "3")
                   }
            return cell
        }
         
        
        //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //      print(DetailsfootballTeamArr.count)
        //
        //        return DetailsfootballTeamArr.count
        //    }
        //
        //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let playerCell = teamPlayersCollectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! PlayersDetailsCollectionViewCell
        //        playerCell.layer.cornerRadius = 20
        //        playerCell.playerName.text = DetailsfootballTeamArr[indexPath.row].player_name
        //        playerCell.playerNumber.text = DetailsfootballTeamArr[indexPath.row].player_number
        //
        //        let playerImgUrl = URL(string: DetailsfootballTeamArr[indexPath.row].player_image ?? "imageNotfound")
        //
        //        if (playerImgUrl != nil)  {
        //            playerCell.playerImg.kf.setImage(with: playerImgUrl, placeholder: UIImage(named: "1"), options: nil, progressBlock: nil, completionHandler: nil)
        //
        //        }
        //        else{
        //            playerCell.playerImg.image = UIImage(named: "3")
        //        }
        //        return playerCell
        //    }
        //
        //
        //    @IBAction func favouriteBtn(_ sender: Any) {
        //
        //
        //
        //    }
        //}
    }
