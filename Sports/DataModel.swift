 

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
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> hadeer

class UrlData {
    let footballLeague = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let basketLeague = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let cricketLeague = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    let tennisLeague = "https://apiv2.allsportsapi.com/tennis/?met=Countries&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440"
    

}
<<<<<<< HEAD
>>>>>>> hadeer
=======
>>>>>>> hadeer
