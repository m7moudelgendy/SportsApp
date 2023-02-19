 

import Foundation
import Alamofire

class NetworkManager
{
  
    func fetchData(compelition:@escaping (Model?)->Void,url:String)
    {
        let urlStr=URL(string:url)
        guard let url=urlStr else{return}
        let request = URLRequest(url: url )
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task=session.dataTask(with: request) { (data, response, error) in
            do
            {
          let resultData = try JSONDecoder().decode(Model.self, from: data!)
         compelition(resultData) //c2

            }
            catch
            {
            compelition(nil)
            print(error.localizedDescription)
            }
        }
        task.resume()
    }

}
 
