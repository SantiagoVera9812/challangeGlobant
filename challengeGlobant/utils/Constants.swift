//
//  Constants.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForMovieList() -> URL? {
            
            return URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c&language=es") ?? nil
        }
        
        static func urlForMovieIDDetails(idMovie: Int) -> URL? {
            
            return URL(string: "https://api.themoviedb.org/3/movie/\(idMovie)?api_key=752cd23fdb3336557bf3d8724e115570&language=es") ?? nil
        }
    }
}
