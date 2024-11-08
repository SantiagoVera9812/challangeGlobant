//
//  MovieRepository.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation

func fetchMovieList(completion: @escaping (MovieListResponse?) -> Void) {
    getMoviesList { movieListResponse in
        if let movies = movieListResponse {
            print(movies)
        } else {
            print("Failed to fetch movies.")
        }
    }
}

func fetchMovieDetailsList(completion: @escaping (MovieListResponse?) -> Void) {
    getMovieDetails {movieListResponse in
        if let movies = movieListResponse {
            print(movies)
        } else {
            print("Failed to fetch movies.")
        }
    }
}
