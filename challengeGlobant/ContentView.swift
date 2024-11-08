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
            GeometryReader { geometry in
                VStack {
                    TextField("Enter something...", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ScrollView {
                        VStack {
                            MovieListViewCell(titulo: "titulo", fechaDeLanzamiento: "fecha lanzar", voteAvarage: 5.7)
                            MovieListViewCell(titulo: "titulo", fechaDeLanzamiento: "fecha lanzar", voteAvarage: 8.7)
                            MovieListViewCell(titulo: "titulo", fechaDeLanzamiento: "fecha lanzar", voteAvarage: 6.7)
                            
                            GridLayout {
                                GridRow {
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                }
                                GridRow {
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                }
                                GridRow {
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                    HorizontalMovieView(title: "titulo", fechaLanzamiento: "fecha lanzar")
                                }
                            }.padding(0)
                                .padding(0)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    ToolBarHeaderView()
                        .padding()
                        .frame(width: geometry.size.height * 0.1, height: geometry.size.height * 0.1)
                        .foregroundColor(.blue)
                        .background(.ultraThinMaterial)
                
                       
                    
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            
    
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
