
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
        
        self.navigationController?.pushViewController(eventsVC, animated: true)
    }
  
}
