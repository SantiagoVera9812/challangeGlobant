//
//  MovieResponse.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import Foundation

struct MovieListResponse: Decodable{
    
    let page: Int
    let total_pages: Int
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    
    let id: Int
    let release_date: String
    let title: String
    let vote_average: Float
    let poster_path: String
    
}


