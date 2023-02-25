//
//  EventsNetwork.swift
//  Sports
//
//  Created by ElGendy on 20/02/2023.
//

import Foundation
class Networking{
    
      func fetchFootballData(complition : @escaping (FootballData?) -> Void,url:String){
       
        let urlStr=URL(string:url)
        guard let url=urlStr else{return}
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            
            do {
                guard let data = data else {return}
                
               var footballData : FootballData?
               footballData = try JSONDecoder().decode(FootballData.self, from: data)
                complition(footballData)
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
   
    func fetchBasketCricketData(complition : @escaping (BasketCricketData?) -> Void,url:String){
       
        let urlStr=URL(string:url)
        guard let url=urlStr else{return}
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            
            do {
                guard let data = data else {return}
                
               var basketData : BasketCricketData?
                basketData = try JSONDecoder().decode(BasketCricketData.self, from: data)
                complition(basketData)
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    func fetchTennisData(complition : @escaping (TennisData?) -> Void,url:String){
       
        let urlStr=URL(string:url)
        guard let url=urlStr else{return}
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            
            do {
                guard let data = data else {return}
                
               var basketData : TennisData?
                basketData = try JSONDecoder().decode(TennisData.self, from: data)
                complition(basketData)
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func fetchFootballTeamsData(complition : @escaping (DetailsModel?) -> Void , teamKey:Int ){
       
        let   urlStr = URL(string:"https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(teamKey)&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3")
             
                guard let url=urlStr else{return}
                let req = URLRequest(url: url)
                print(url)
                let session = URLSession(configuration: URLSessionConfiguration.default)
                
                let task = session.dataTask(with: req) { data, response, error in
                    
                    do {
                        guard let data = data else {return}
                        
                        var footballTeamsData : DetailsModel?
                        footballTeamsData = try JSONDecoder().decode(DetailsModel.self, from: data)
                        complition(footballTeamsData)
                    }catch{
                        complition(nil)
                        print(error.localizedDescription)
                    }
                    
                }
               task.resume()
              }
//    func fetchBasketTeamsData(complition : @escaping (DetailsModel?) -> Void , teamKey:Int ){
//                let
//            urlStr=URL(string:"https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(teamKey)&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3")
//                guard let url=urlStr else{return}
//                let req = URLRequest(url: url)
//                print(url)
//                let session = URLSession(configuration: URLSessionConfiguration.default)
//
//                let task = session.dataTask(with: req) { data, response, error in
//
//                    do {
//                        guard let data = data else {return}
//
//                        var footballTeamsData : DetailsModel?
//                        footballTeamsData = try JSONDecoder().decode(DetailsModel.self, from: data)
//                        complition(footballTeamsData)
//                    }catch{
//                        complition(nil)
//                        print(error.localizedDescription)
//                    }
//
//                }
//               task.resume()
//              }
//    func fetchCricketTeamsData(complition : @escaping (DetailsModel?) -> Void , teamKey:Int ){
//                let
//            urlStr=URL(string:"https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(teamKey)&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3")
//                guard let url=urlStr else{return}
//                let req = URLRequest(url: url)
//                print(url)
//                let session = URLSession(configuration: URLSessionConfiguration.default)
//
//                let task = session.dataTask(with: req) { data, response, error in
//
//                    do {
//                        guard let data = data else {return}
//
//                        var footballTeamsData : DetailsModel?
//                        footballTeamsData = try JSONDecoder().decode(DetailsModel.self, from: data)
//                        complition(footballTeamsData)
//                    }catch{
//                        complition(nil)
//                        print(error.localizedDescription)
//                    }
//
//                }
//               task.resume()
//              }
//    func fetchTennisTeamsData(complition : @escaping (DetailsModel?) -> Void , teamKey:Int ){
//                let
//            urlStr=URL(string:"https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(teamKey)&APIkey=5cc60ab1321da1aae744e3e0781c99cb7b266ea9e4121466a66fa55bd4b85440&from=2020-06-3&to=2020-06-3")
//                guard let url=urlStr else{return}
//                let req = URLRequest(url: url)
//                print(url)
//                let session = URLSession(configuration: URLSessionConfiguration.default)
//
//                let task = session.dataTask(with: req) { data, response, error in
//
//                    do {
//                        guard let data = data else {return}
//
//                        var footballTeamsData : DetailsModel?
//                        footballTeamsData = try JSONDecoder().decode(DetailsModel.self, from: data)
//                        complition(footballTeamsData)
//                    }catch{
//                        complition(nil)
//                        print(error.localizedDescription)
//                    }
//
//                }
//               task.resume()
//              }
}
