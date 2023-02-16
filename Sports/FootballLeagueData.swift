//
//  FootballLeagueData.swift
//  Sports
//
//  Created by ElGendy on 16/02/2023.
//

import Foundation

class results : Decodable{
    
    var league_key : Int?
    var league_name : String?
    var country_key : Int?
    var country_name : String?
    var league_logo : String?
    var country_logo : String?
}

class FootballData : Decodable{
    
    var success : Int
    var result : [results]
}
