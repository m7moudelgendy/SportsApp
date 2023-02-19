 import UIKit
import SwiftyGif
class LunchScreenViewController: UIViewController {
    //object from animationViewClass
    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
        
        //to hide navigationbarr
        self.navigationController?.navigationBar.isHidden=true
    }
    
}
    extension LunchScreenViewController:SwiftyGifDelegate {
        func gifDidStop(sender: UIImageView) {
            logoAnimationView.isHidden = true
            let delay : Double = 0.4    // 4 seconds here
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                // Code to go to other controller, either segue, or VC instantiation
                //Go to HomeViewController
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController

                self.navigationController?.pushViewController(homeVC, animated: true)

                
            }
        }
     
}
