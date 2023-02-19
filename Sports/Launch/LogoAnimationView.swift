 

import UIKit
import SwiftyGif

class LogoAnimationView: UIView {
    
    let logoGifImageView: UIImageView = {
        guard let gifImage = try? UIImage(gifName: "gif.gif") else {
            return UIImageView()
            
        }
        return UIImageView(gifImage: gifImage, loopCount: 1)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
   //     backgroundColor = UIColor(white: 0 / 0, alpha: 1)
        backgroundColor = UIColor.clear
         addSubview(logoGifImageView)
 
       logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
         logoGifImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
         logoGifImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoGifImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoGifImageView.heightAnchor.constraint(equalToConstant: 550).isActive = true
        
   //     logoGifImageView.frame.origin.x = 10 ;
        
       
 
      }
}
