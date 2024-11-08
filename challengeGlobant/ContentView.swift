//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter something...", text: $inputText)
                          .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a rounded border style
                          
            
            HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
            
            MovieListViewCell(titulo: "titulo", fechaDeLanzamiento: "fecha lanzar", voteAvarage: 5.7)
            
            Spacer()
            
        }
        .padding()
        //Simplemente se quiere probar la respuesta de los API endpoints
        .onAppear(){
            
            fetchMovieList { movieListResponse in
                if let movies = movieListResponse {
                    
                    print(movies)
                    
                } else {
                    print("Failed to fetch movies.")
                }
            }
            
            fetchMovieDetailsList{
                details in
                if let movieDetail = details{
                    print(movieDetail)
                } else {
                    print("Failed to fetch movie detail")
                }
            }
        }
    }

}


#Preview {
    ContentView()
}
