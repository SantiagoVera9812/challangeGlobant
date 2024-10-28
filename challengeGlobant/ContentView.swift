//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(
                 "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c&language=es"
                  )
            Text("https://api.themoviedb.org/3/movie/1184918?api_key=752cd23fdb3336557bf3d8724e115570&language=es")
            
        }
        .padding()
        //Simplemente se quiere probar la respuesta de los API endpoints
        .onAppear(){
            getMoviesList()
            getMovieDetails()
        }
    }
    
    
    
    
}

//Funciones para usar las URLS vistas

func getMoviesList(){
    
    guard let weatherURL = Constants.Urls.urlForMovieList() else { return}
    
    let weatherResource = Resource<MovieListResponse>(url: weatherURL){
        
        data in
        
        let weatherResponse = try?
        JSONDecoder().decode(MovieListResponse.self, from: data)
        
        return weatherResponse
    }
    
    WebService().load(resource: weatherResource){
        
        (result) in
        if let weatherResource = result {
            
            print(weatherResource)
        }
    }
    
}

func getMovieDetails(){
    
    //Valor de ID chinomatico para probar las respuestas del URL
    guard let weatherURL = Constants.Urls.urlForMovieIDDetails(idMovie: 1184918) else {return}
    
    let weatherResource = Resource<MovieDetailsResponse>(url: weatherURL) {
        
        data in
        
        let weatherResponse = try?
        JSONDecoder().decode(MovieDetailsResponse.self, from: data)
        
        return weatherResponse
        
    }
    
    WebService().load(resource: weatherResource){
        
        (result) in
        
        if let weatherResource = result{
            
            print(weatherResource)
        }
    }
}

#Preview {
    ContentView()
}
