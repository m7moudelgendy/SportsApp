
import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {
    
    var recievedLeaguesArr = [League]()
    var networkManagerObj = NetworkManager()
    var  apiUrl :String? = ""
    var sportKey : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManagerObj.fetchData(compelition: { leagues in
        DispatchQueue.main.async { [self] in
            recievedLeaguesArr = leagues!.result
            // self.tableView.reloadData()
           // guard (leagues?.result) != nil else {return}
            print(sportKey)
             self.tableView.reloadData()

        }}, url: apiUrl!)
        }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recievedLeaguesArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! LeagueTableViewCell
        cell.layer.cornerRadius=15
        cell.layer.borderColor = UIColor.systemYellow.cgColor
        cell.layer.borderWidth = 1
        switch sportKey {
        case 0...2:
            cell.leagueNameLabel.text = recievedLeaguesArr[indexPath.row].league_name
             break
        case 3:
            cell.leagueNameLabel.text = recievedLeaguesArr[indexPath.row].country_name
            break
        default:
            break
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventsVC = self.storyboard?.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
        switch sportKey{
        case 0:
            eventsVC.apiUrl = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2021-05-18&to=2021-05-18"
            eventsVC.upcoming_Index = sportKey
            print("Event View")
            break
        case 1:
            eventsVC.apiUrl = "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2021-05-18&to=2021-05-19"
            eventsVC.upcoming_Index = sportKey
            print("Event View")
            break
        case 2:
            eventsVC.apiUrl = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2023-02-16&to=2023-02-19"
            eventsVC.upcoming_Index = sportKey
            print("Event View")
            break
        case 3:
            eventsVC.apiUrl = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3"
            eventsVC.upcoming_Index = sportKey
            print("Event View")
        default:
            break
        }
        
        self.navigationController?.pushViewController(eventsVC, animated: true)
    }
  
}

