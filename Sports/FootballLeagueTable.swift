//
//  FootballLeagueTable.swift
//  Sports
//
//  Created by ElGendy on 15/02/2023.
//

import UIKit
import Kingfisher

class FootballLeagueTable: UITableViewController {
    
    var legArray = [results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchFootballData { footData in
            DispatchQueue.main.async {
                self.legArray = footData!.result
                self.tableView.reloadData()
            }
            }
        }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return legArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = legArray[indexPath.row].league_name
        cell.detailTextLabel?.text = legArray[indexPath.row].country_name
        
        
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.1
        cell.textLabel?.font.withSize(10.0)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
    func fetchFootballData(complition : @escaping (FootballData?) -> Void){
        
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440")
        guard let url = url else {return }
        
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            
            do {
                guard let data = data else {return}
                
               var footballData : FootballData?
               footballData = try JSONDecoder().decode(FootballData.self, from: data)
                complition(footballData)
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
