//
//  UpcomingDataModel.swift
//  Sports
//
//  Created by ElGendy on 20/02/2023.
//

import Foundation

class FootballData : Decodable{
    var success : Int
    var result : [FootballResults]
}

class FootballResults : Decodable{
    
    var league_key : Int?
    var league_name : String?
    var country_key : Int?
    var country_name : String?
    var league_logo : String?
    var country_logo : String?
    var event_home_team : String?
    var event_away_team : String?
    var home_team_logo : String?
    var away_team_logo : String?
    var event_time : String?
    var event_date : String?
    var event_final_result : String?
    var home_team_key : Int?
    var away_team_key : Int?
    
}

class BasketCricketData : Decodable{
    
    var success : Int
    var result : [BasketCricketResults]
}

class BasketCricketResults : Decodable{
    
    var event_home_team : String?
    var event_away_team : String?
    var event_home_team_logo : String?
    var event_away_team_logo : String?
    var event_time : String?
    var event_date : String?
    var event_final_result : String?
    var home_team_key : Int?
    var away_team_key : Int?

}

class TennisData : Decodable{
    
    var success : Int
    var result : [TennisResults]
}

class TennisResults : Decodable{
    
    var event_first_player : String?
    var event_second_player : String?
    var event_first_player_logo : String?
    var event_second_player_logo : String?
    var event_time : String?
    var event_date : String?
    var event_final_result : String?
    var home_team_key : Int?
    var away_team_key : Int?

}

