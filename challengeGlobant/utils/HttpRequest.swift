//
//  HttpRequest.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation
import SwiftUI


//Funciones para usar las URLS vistas

class MovieService {
    
    func getMoviesList(language: String, completion: @escaping (MovieListResponse?) -> Void){
        
        guard let weatherURL = Constants.Urls.urlForMovieList(languague: language) else { return}
        
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
    
    func getMovieDetails(idMovie: Int, language: String, completion: @escaping (MovieDetailsResponse?) -> Void) {
        
        //Valor de ID chinomatico para probar las respuestas del URL
        guard let weatherURL = Constants.Urls.urlForMovieIDDetails(idMovie: idMovie, languague: language) else {return}
        
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
    
    func getAsyncImage(posterPath: String) -> some View {
        if let url = Constants.Urls.urlForMoviePoster(poster_path: posterPath) {
            return AnyView(
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .cornerRadius(8)
                        .frame(width: 100, height: 150)
                } placeholder: {
                    ProgressView()
                }
            )
        } else {
            // Return a placeholder or empty view if the URL is nil
            return AnyView(EmptyView())
        }
    }
    

}
