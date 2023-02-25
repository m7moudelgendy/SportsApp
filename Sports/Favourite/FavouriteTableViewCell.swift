

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogo: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        teamName.numberOfLines = 0
        teamName.lineBreakMode = .byWordWrapping
    }}

