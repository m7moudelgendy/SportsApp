
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.layer.borderColor = UIColor.brown.cgColor
        cell.layer.borderWidth = 1
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.1
        cell.textLabel?.font.withSize(10.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18.0)
        switch sportKey {
        case 0...2:
            cell.textLabel?.text = recievedLeaguesArr[indexPath.row].league_name
            cell.detailTextLabel?.text = recievedLeaguesArr[indexPath.row].country_name
            break
        case 3:
            cell.textLabel?.text = recievedLeaguesArr[indexPath.row].country_name
            break
        default:
            break
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let splitView = self.storyboard?.instantiateViewController(withIdentifier: "splitViewController") as! splitViewController
        
        self.navigationController?.pushViewController(splitView, animated: true)
    }
  
}
