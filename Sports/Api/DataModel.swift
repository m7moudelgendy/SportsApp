import Foundation
 
///leagues Model
 class League :Decodable
{
    var league_key : Int?
    var league_name : String?
    var country_key :Int?
    var country_name :String?
    var league_logo :String?
    var country_logo :String?
 
}



class Model : Decodable
{
    var result:[League]
    var success:Int?
   
}
class Player : Decodable
{
    var  player_key:Int?
    var  player_name:String?
    var  player_number:String?
    var  player_age:String?
    var  player_match_played:String?
    var  player_goals:String?
    var  player_yellow_cards:String?
    var  player_red_cards:String?
    var  player_image:String?

     
}

class TeamsDataModel :Decodable

{
   var team_key : Int?
   var  team_name : String?
    var team_logo : String?
    var players : [Player]
}
class DetailsModel : Decodable
{
    var result:[TeamsDataModel]
    var success:Int?
}

class UrlData {
    
    let footballLeague = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let basketLeague = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let cricketLeague = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let tennisLeague = "https://apiv2.allsportsapi.com/tennis/?met=Countries&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
 

     let eventsFootballLeagueApiURL = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2021-05-18&to=2021-05-18"
    let EventsBasketballLeagueApiURL = "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2021-05-18&to=2021-05-19"
    let  EventsCricketLeagueApiURL = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2023-02-16&to=2023-02-19"
    let  EventsTennisLeagueApiURL = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3"
//    init(TeamId: Int) {
//        self.TeamId = TeamId+1
//    }
//    while (TeamId <=200)
//    {
//        var footballDetailsApiURL  = "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(TeamId)&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3"
   //        TeamId++
    //}
 }
   
    
  //  let basketDetailsApiURL =
  //  let cricketDetailsApiURL =
   // let tennisDetailsApiURL =
