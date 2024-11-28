//
//  MovieDetailsResponse.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 22/11/24.
//

import Foundation

struct MovieDetailsResponse: Decodable{
    
    let id: Int
    let title: String
    let status: String
    let vote_average: Float
    let release_date: String
    var overview: String
    let genres: [Genre]
    let poster_path: String
}

struct Genre: Decodable{
    
    let id: Int
    let name: String
}
