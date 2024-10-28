//
//  MovieResponse.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import Foundation

struct MovieListResponse: Decodable{
    
    let page: Int
    let results: [MovieResponse]
}

struct MovieResponse: Decodable{
    
    let id: Int
}

struct MovieDetailsResponse: Decodable{
    
    let title: String
    let status: String
    let vote_average: Float
}
