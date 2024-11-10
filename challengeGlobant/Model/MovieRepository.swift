//
//  MovieRepository.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation



func fetchMovieList(language: String) {
        
    getMoviesList(language: language) { movieListResponse in
        if let movies = movieListResponse {
            
            movies.results.forEach{movieFound in
                
                print(movieFound)
            }
            
        } else {
            print("Failed to fetch movies.")
            
        }
    }
    
}

func fetchMovieDetailsList(idMovie: Int, language: String) {
    
    getMovieDetails(idMovie: idMovie, language: language) {movieListResponse in
        if let movies = movieListResponse {
            print(movies)
        } else {
            print("Failed to fetch movies.")
        }
    }
}
