 
import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBOutlet weak var leagueLogo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
        // to make padding for cell (spacee between cells)
    override func layoutSubviews() {
        super.layoutSubviews()
        //make space for cells
        
      layer.frame = layer.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 6, right: 20))
        // multible line for leagues label
        leagueNameLabel.numberOfLines = 0
        leagueNameLabel.lineBreakMode = .byWordWrapping
    }}
