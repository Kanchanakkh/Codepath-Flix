//
//  File.swift
//  flixster
//
//  Created by Kanchanak Khat on 9/11/20.
//  Copyright © 2020 Kanchanak Khat. All rights reserved.
//

import Foundation

struct MovieApi{
  
  static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
  static let base_url = "https://api.themoviedb.org/3/movie/"
    
 
    
  static func nowPlayingMovies(completion: @escaping ([Movie]?) -> Void) {
   
    let url = URL(string: base_url + "now_playing?api_key=\(apiKey)")!
    var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      // This will run when the network request returns
      if let error = error {
        print(error.localizedDescription)
      }else if let data = data {
        
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
        
        let movies = Movie.getMovie(dict: movieDictionaries)
      
        return completion(movies)
    }
    }
    task.resume()
  }
    static func superHeroMovies(completion: @escaping ([Movie]) -> Void){
        let url = URL(string: base_url + "297762/similar?api_key=\(apiKey)")!
           var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
           request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
           let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
           let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
               print(error.localizedDescription)
             }else if let data = data {
               
               let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
               
               let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
               
           }
           }
           task.resume()
    }
 
  
}
