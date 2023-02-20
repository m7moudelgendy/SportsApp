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
}
