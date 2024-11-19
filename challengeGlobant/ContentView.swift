//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var inputText: String = ""
    @ObservedObject var controller = MovieViewController()
    @ObservedObject var tapBarController = ToolBarViewController()
    @State private var page: Int = 1
    
        var body: some View {
            GeometryReader { geometry in
                
                VStack {
                
                    //Switch case para listar peliculas
                    switch controller.movieListState {
                            case .initial:
                                EmptyView()
                            case .loading:
                                ProgressView("Loading...")
                            case .empty:
                                Text("No movies available.")
                            case .businessError(_, let message):
                                Text(message ?? "An error occurred.")
                            case .success(let movies):
                        
                        TextLabelInput(inputText: $inputText)
                            .onChange(of: inputText) { oldState, newState in
                                
                                
                                let startsInput =     startsWithPattern(in: movies.first?.title, pattern: newState)
                                
                                if(startsInput){
                                    
                                    print(newState)
                                }
                                        }
                    
                        if(tapBarController.isPhotoActive){
                            ListVerticallyMovieViews(listOfMovies: movies,
                                                     imageController: controller,
                                                     onTapController: controller)
                            .padding(10)
                            
                        } else {
                            
                            ListHorizontalMovieViews(listOfMovies: movies, imageController: controller, onTapController: controller)
                        }
                        
                        HStack {
                            
                            //Se agrego este switch para verificar que el usuario no se vaya mas de lo permitido
                            
                            switch controller.totalMoviees {
                            
                            case .success(let value):
                                BeforeButton(page: $page, controller: controller)
                                NextButton(page: $page, totalResponses: value, controller: controller)
                            case .businessError( _, let message):
                                Text(message ?? "An error occurred.")
                            default:
                                Text("No total")
                            }
                                        
                                    }
                        
                        ToolBarHeaderView(controller: tapBarController)
                            .padding()
                            .background(.ultraThinMaterial)
                            .frame(alignment: .bottom)
                        
                        
                                
                            }
                    
                    //Switch case para los detalles de una pelicula
                    
                    switch controller.movieDetails {
                    case .initial:
                        EmptyView()
                    case .loading:
                        ProgressView("Loading...")
                    case .empty:
                        Text("No movies available.")
                    case .success(let movieDetails):
                        
                        HeaderView(page: $page, controller: controller)
                        
                        MovieDetails(titulo: movieDetails.title, votoAvarage: movieDetails.vote_average, fechaDeLanzamiento: movieDetails.release_date, posterPath: movieDetails.poster_path, overView: movieDetails.overview, genres: movieDetails.genres, imageController: controller)
                        
                    case .businessError(_, let message):
                        
                        Text(message ?? "An error occurred.")
                    }
                        
                    Spacer()
                    
                
                }
                .padding()
                
                Spacer()
                
            }
    
    }
    
    

}




#Preview {
    ContentView()
}
