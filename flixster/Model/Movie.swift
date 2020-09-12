//
//  File.swift
//  flixster
//
//  Created by Kanchanak Khat on 9/11/20.
//  Copyright © 2020 Kanchanak Khat. All rights reserved.
//

import Foundation

class Movie {
  var id: Int
  var title: String
 
  var overview: String
  var posterURL: URL?
  var backdropURL: URL?
  var trailerURL: URL?

  
  init(dictionary: [String: Any]) {
    title = dictionary["title"] as! String
   
    overview = dictionary["overview"] as! String
    
    id = dictionary["id"] as! Int
    
    let posterPathString = dictionary["poster_path"] as! String
    posterURL = URL(string: "https://image.tmdb.org/t/p/w185\(posterPathString)")
    
    let backdropPathString = dictionary["backdrop_path"] as! String
   
    backdropURL = URL(string: "https://image.tmdb.org/t/p/w780\(backdropPathString)")
   
    trailerURL = URL(string: "https://api.themoviedb.org/3/movie/\(id) /videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")
  }
  
    class func getMovie(dict: [[String: Any]]) -> [Movie] {
    var movies: [Movie] = []
    for dictionary in dict {
        let movie = Movie(dictionary: dictionary)
      movies.append(movie)
    }
    return movies
  }
}


