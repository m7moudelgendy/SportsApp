  
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
    @IBAction func favBtn(_ sender: UIButton) {
        self.createItem(name: self.teamName)
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    
    var models = [SportsListItem]()
    
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var teamNameLabel: UILabel!
    var  apiUrl :String = ""
    var  teamID :Int = 0
    var networkManagerObj = Networking()
    var playersArr : [Player] = []
    var teamName = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.delegate = self
        detailsTable.dataSource = self
         getAllItems()
         print(models.count ,"coreData")
         print(teamName , "coreData")
         for index in 0 ..< (models.count) {
             if teamName == models[index].name {
                 toggleButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
             }
             else {
                 toggleButton.setImage(UIImage(systemName: "heart"), for: .normal)
             }
         }
         
         networkManagerObj.fetchFootballTeamsData (complition: {teams in
            DispatchQueue.main.async { [self] in
                playersArr = teams!.result[0].players
                 self.detailsTable.reloadData()
                 guard (teams?.result) != nil else {return}
                self.detailsTable.reloadData()
                self.teamName = teams?.result[0].team_name ?? ""
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
            
            //customizeButtonSelected()
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
    
         //core data
    
    func createItem(name: String){
        let newItem = SportsListItem(context: context)
        newItem.name = name
        //newItem.teamImg
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
            /*DispatchQueue.main.async {
                self.tableView.reloadData()
            }*/
        }
        catch {
            
        }
    }
    /*func updateItem(item: SportsListItem , newName : String){
        item.name = newName
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }*/
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
/*
 if toggleButtonChecked == false
 {
     toggleButtonChecked = true
     
 }
 else
 {
     toggleButtonChecked = false
     cutomizeButtonNotSelected()
     self.createItem(name: self.teamName)
 }
 var toggleButtonChecked = false
 
 func customizeButtonSelected(){
     toggleButton
 }
 func cutomizeButtonNotSelected(){
     toggleButton.setImage(UIImage(systemName: "heart"), for: .normal)
 }
 */
