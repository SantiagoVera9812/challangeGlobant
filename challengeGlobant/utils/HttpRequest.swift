//
//  HttpRequest.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation
import SwiftUI


//Funciones para usar las URLS vistas

func getMoviesList(completion: @escaping (MovieListResponse?) -> Void){
    
    guard let weatherURL = Constants.Urls.urlForMovieList(languague: "en") else { return}
    
    let weatherResource = Resource<MovieListResponse>(url: weatherURL){
        
        data in
        
        let weatherResponse = try?
        JSONDecoder().decode(MovieListResponse.self, from: data)
        
        return weatherResponse
    }
    
    WebService().load(resource: weatherResource){
        
        result in
                if let movieResponse = result {
                    completion(movieResponse)
                } else {
                    completion(nil)
                }
    }
    
}

func getMovieDetails(completion: @escaping (MovieDetailsResponse?) -> Void) {
    
    //Valor de ID chinomatico para probar las respuestas del URL
    guard let weatherURL = Constants.Urls.urlForMovieIDDetails(idMovie: 1184918, languague: "en") else {return}
    
    let weatherResource = Resource<MovieDetailsResponse>(url: weatherURL) {
        
        data in
        
        let weatherResponse = try?
        JSONDecoder().decode(MovieDetailsResponse.self, from: data)
        
        return weatherResponse
        
    }
    
    WebService().load(resource: weatherResource){
        
        result in
                if let movieResponse = result {
                    completion(movieResponse)
                } else {
                    completion(nil)
                }
    }
}

struct MoviePosterView: View {
    let posterPath: String
    
    var body: some View {
        if let url = Constants.Urls.urlForMoviePoster(poster_path: posterPath) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView() 
            }
        }
    }
    
}


