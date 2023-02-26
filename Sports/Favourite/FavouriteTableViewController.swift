
import UIKit
import Kingfisher

class FavouriteTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [SportsListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            getAllItems()
            self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
  
             getAllItems()
            self.tableView.reloadData()
         
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! FavouriteTableViewCell

        cell.layer.cornerRadius=15
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        let model = models[indexPath.row]
        
        cell.teamName.text = model.name
        let TeamLogoUrl = URL(string: models[indexPath.row].teamImg ?? "imageNotfound")
        if (TeamLogoUrl != nil)
       {
            let processor = RoundCornerImageProcessor(cornerRadius:12)
            cell.teamLogo.kf.setImage(with: TeamLogoUrl, placeholder: UIImage(named: "placeHolder"),options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(2)),
                .cacheOriginalImage
            ], progressBlock: nil, completionHandler: nil)
        }
       
       else{
           cell.teamLogo.image = UIImage(named: "placeHolder")
       }
        
        
         return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title:"Delete", message: "Are You Sure ?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [self] UIAlertAction in
            
            self.deleteItem(item:models[indexPath.row] )
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { [self] UIAlertAction in
          dismiss(animated: true)
        }))
     
        self.present(alert, animated: true, completion: nil)
 
    

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.0
    }
    
    func getAllItems(){
        do{
            let items = try context.fetch(SportsListItem.fetchRequest())
            models = items
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
    func deleteItem(item: SportsListItem){
        context.delete(item)
        do {
            try context.save()
            getAllItems()

        }
        catch {
            
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
         headerView.backgroundColor = UIColor.clear
        
         return headerView
        
        
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
     

}
