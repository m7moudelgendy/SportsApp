 

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
