//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI



struct ContentView: View {
    
    
    
        @State private var inputText: String = ""
    @ObservedObject var controller = MovieViewController()
        var body: some View {
            GeometryReader { geometry in
                
                
                VStack {
                    
                    if controller.isLoading {
                        ProgressView("Cargando Peliculas")
                    } else if let errormESSAGE = controller.errormESSAGE {
                        
                        Text(errormESSAGE)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    } else {
                        
                        let listOfMovies = controller.movieList
                        
                        
                        ListVerticallyMovieViews(listOfMovies: listOfMovies, imageController: controller)
                                .padding()
                        
                        ListHorizontalMovieViews(listOfMovies: listOfMovies, imageController: controller)
                        
                        
                        Text(controller.movieDetails.overview)
                        
                       /* List(controller.movieList){
                            movie in
                            MovieListViewCell(titulo: movie.title, fechaDeLanzamiento: movie.release_date, voteAvarage: Double(movie.vote_average))
                        } */
                    }
                    
                    TextField("Enter something...", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
        
                    ToolBarHeaderView()
                        .padding()
                        .frame(width: geometry.size.height * 0.1, height: geometry.size.height * 0.1)
                        .foregroundColor(.blue)
                        .background(.ultraThinMaterial)
                
                    
                }
                .padding()
            }
    
    }

}


#Preview {
    ContentView()
}
