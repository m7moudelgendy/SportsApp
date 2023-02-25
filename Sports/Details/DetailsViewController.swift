
import UIKit
import CoreData
import Kingfisher

class DetailsViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var playersCollectionView: UICollectionView!
    var  apiUrl :String = ""
    var  teamID :Int = 0
    var networkManagerObj = Networking()
    var playersArr : [Player] = []
    //Core Data
    var teamName = ""
    var teamImg = ""
    var models = [SportsListItem]()
    var isFavFlag = false
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sportKey : Int = 0
    var favTeamName :String = ""
    var basketCricketTeamName :String = ""
    var basketCricketTeamLogo :String = ""
    
    //Favourite Function
    @IBAction func favBtn(_ sender: UIButton) {
        
        self.createItem(name: self.teamName , isFav: isFavFlag , teamImg: self.teamImg)
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
    }
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var viewbackground: UIView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersCollectionView.delegate = self
        playersCollectionView.dataSource = self
        getAllItems()
        
        networkManagerObj.fetchFootballTeamsData (complition: {teams in
            DispatchQueue.main.async { [self] in
                playersArr = teams!.result[0].players
                guard (teams?.result) != nil else {return}
                ///Core Data
                self.teamName = teams?.result[0].team_name ?? ""
                self.teamImg = teams?.result[0].team_logo ?? ""
                
                
                /// fetch team  name & logo
                teamNameLabel.text = teams?.result[0].team_name
                let teamImgUrl = URL(string: teams?.result[0].team_logo ?? "imageNotfound")
                
                if (teamImgUrl != nil)  {
                    teamLogo.kf.setImage(with: teamImgUrl, placeholder: UIImage(named: "placeHolder"), options: nil, progressBlock: nil, completionHandler: nil)
                    
                }
                else{
                    teamLogo.image = UIImage(named: "placeHolder")
                }
                self.playersCollectionView.reloadData()
                
            }
            
        } , teamKey: teamID)
        ///make View Raduis
        viewbackground.layer.cornerRadius = 60
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        ///save sataus of favorite btn
        print(models.count ,"coreData")
        print(favTeamName , "coreData")
        
        for index in 0 ..< (models.count) {
            if favTeamName == models[index].name {
                toggleButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                print(models[index].isFav)
                toggleButton.reloadInputViews()
                break
            }
            
            else {
                toggleButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playersArr.count}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let playerCell = playersCollectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! playersDetailsCollectionViewCell
        
        playerCell.layer.cornerRadius = 20
        playerCell.layer.borderColor = UIColor.systemYellow.cgColor
        playerCell.layer.borderWidth = 1
        playerCell.layer.masksToBounds = true
        playerCell.layer.shadowOffset = CGSizeMake(6, 6)
        playerCell.layer.shadowColor = UIColor.white.cgColor
        playerCell.layer.shadowOpacity = 0.1
        playerCell.layer.shadowRadius = 4
        playerCell.playerName.text =  playersArr[indexPath.row].player_name
        playerCell.playerNumber.text = playersArr[indexPath.row].player_number
        playerCell.playerType.text = playersArr[indexPath.row].player_type
        playerCell.cardYellowNum.text = playersArr[indexPath.row].player_yellow_cards
        playerCell.redCardNum.text = playersArr[indexPath.row].player_red_cards
        let processor = RoundCornerImageProcessor(cornerRadius: 60)
        let playerImageUrl = URL(string: playersArr[indexPath.row].player_image ?? "imageNotfound")
        if (playerImageUrl != nil)
        {
            playerCell.playeImage.kf.setImage(with: playerImageUrl, placeholder: UIImage(named: "playerplaceholder"),options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(2)),
                .cacheOriginalImage
            ], progressBlock: nil, completionHandler: nil)}
        else{
            playerCell.playeImage.image = UIImage(named: "playerplaceholder")
        }
        return playerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 239, height: 349)
    }
    
    //core data
    func createItem(name: String , isFav : Bool, teamImg : String   ){
        let newItem = SportsListItem(context: context)
        newItem.name = name
        newItem.isFav = true
        newItem.teamImg = teamImg
        //   newItem.teamImg =
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
        print("label")
    }
    func getAllItems(){
        do{
            let items = try context.fetch(SportsListItem.fetchRequest())
            models = items
            
        }
        catch {
            
        }
    }
    
}


