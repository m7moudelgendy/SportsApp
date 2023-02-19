//
//  SportsCollectionViewCell.swift
//  Sports
//
//  Created by ElGendy on 14/02/2023.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    

    
    @IBOutlet weak var sportIMG: UIImageView!
    @IBOutlet weak var sportName: UILabel!
    
    func setCell(photo : UIImage, title : String){
        sportIMG.image = photo
        sportName.text = title
    }
    
}
