//
//  upComingCollectionViewCell.swift
//  Sports
//
//  Created by Hader on 17/2/23.
//

import UIKit
import Kingfisher

class upComingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var team1LB: UILabel!
    @IBOutlet weak var team1Img: UIImageView!
    @IBOutlet weak var dateLB: UILabel!
    @IBOutlet weak var team2Img: UIImageView!
    
    @IBOutlet weak var team2LB: UILabel!
    
    @IBOutlet weak var timeLB: UILabel!
    
    func configureCellFootball(Event: FootballResults){
        self.layer.cornerRadius = 35
        team1LB.text = Event.event_home_team
        team2LB.text = Event.event_away_team
        timeLB.text = Event.event_time
        dateLB.text = Event.event_date
        let homeURL = Event.home_team_logo!
        let awayURL = Event.away_team_logo!
        let predicate = NSPredicate(format:"SELF ENDSWITH[c] %@", ".jpg")
        let homeResult = predicate.evaluate(with: homeURL)
        let awayResult = predicate.evaluate(with: awayURL)
        if homeResult{
            let url = URL(string: (Event.home_team_logo)!)
            team1Img.kf.setImage(with: url)
        }else{
            team1Img.image = UIImage(named: "placeHolder")
        }
        if awayResult{
            let url = URL(string: (Event.away_team_logo)!)
            team2Img.kf.setImage(with: url)
        }else{
            team2Img.image = UIImage(named: "placeHolder")
        }
        team1Img.kf.indicatorType = .activity
        team2Img.kf.indicatorType = .activity
    }
    func configureCellBasketCricket(BasketEvent: BasketCricketResults){
        self.layer.cornerRadius = 35
        team1LB.text = BasketEvent.event_home_team
        team2LB.text = BasketEvent.event_away_team
        timeLB.text = BasketEvent.event_time
        dateLB.text = BasketEvent.event_date
        let homeURL = BasketEvent.event_home_team_logo
        let awayURL = BasketEvent.event_away_team_logo
        let predicate = NSPredicate(format:"SELF ENDSWITH[c] %@", ".jpg")
        let homeResult = predicate.evaluate(with: homeURL)
        let awayResult = predicate.evaluate(with: awayURL)
        if homeResult{
            let url = URL(string: (BasketEvent.event_home_team_logo)!)
            team1Img.kf.setImage(with: url)
        }else{
            team1Img.image = UIImage(named: "placeHolder")
        }
        if awayResult{
            let url = URL(string: (BasketEvent.event_away_team_logo)!)
            team2Img.kf.setImage(with: url)
        }else{
            team2Img.image = UIImage(named: "placeHolder")
        }
        
    }
    func configureCellTennis(TennisEvent: TennisResults){
        self.layer.cornerRadius = 35
        team1LB.text = TennisEvent.event_first_player
        team2LB.text = TennisEvent.event_second_player
        timeLB.text = TennisEvent.event_time
        dateLB.text = TennisEvent.event_date
        let homeURL = TennisEvent.event_first_player_logo
        let awayURL = TennisEvent.event_second_player_logo
        let predicate = NSPredicate(format:"SELF ENDSWITH[c] %@", ".jpg")
        let homeResult = predicate.evaluate(with: homeURL)
        let awayResult = predicate.evaluate(with: awayURL)
        if homeResult{
            let url = URL(string: (TennisEvent.event_first_player_logo)!)
            team1Img.kf.setImage(with: url)
        }else{
            team1Img.image = UIImage(named: "placeHolder")
        }
        if awayResult{
            let url = URL(string: (TennisEvent.event_second_player_logo)!)
            team2Img.kf.setImage(with: url)
        }else{
            team2Img.image = UIImage(named: "placeHolder")
        }
        
    }
    
}
