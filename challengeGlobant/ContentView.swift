//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI


struct ContentView: View {
    
    
    
        @State private var inputText: String = ""
    @State private var detailsText: String = "This is some details text."
    @ObservedObject var controller = MovieViewController()
    @ObservedObject var tapBarController = ToolBarViewController()
    @State private var page: Int = 0
    
        var body: some View {
            GeometryReader { geometry in
                
                VStack {
                    
                  /*  if let movieDetails = controller.movieDetails {
                    
                        MovieDetails(titulo: movieDetails.title, votoAvarage: movieDetails.vote_average, fechaDeLanzamiento: movieDetails.release_date, posterPath: movieDetails.poster_path, overView: movieDetails.overview, imageController: controller)
                        
                    } */
                    
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
                        
                        TextField("Enter something...", text: $inputText)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        if(tapBarController.isPhotoActive){
                            ListVerticallyMovieViews(listOfMovies: movies,
                                                     imageController: controller,
                                                     onTapController: controller)
                            .padding(10)
                            
                        } else {
                            
                            ListHorizontalMovieViews(listOfMovies: movies, imageController: controller, onTapController: controller)
                        }
                        
                        HStack {
                                        BeforeButton(page: $page, controller: controller)
                                        NextButton(page: $page, controller: controller)
                                    }
                        
                        
                                
                            }
                    
                    switch controller.movieDetails {
                    case .initial:
                        EmptyView()
                    case .loading:
                        ProgressView("Loading...")
                    case .empty:
                        Text("No movies available.")
                    case .success(let movieDetails):
                        MovieDetails(titulo: movieDetails.title, votoAvarage: movieDetails.vote_average, fechaDeLanzamiento: movieDetails.release_date, posterPath: movieDetails.poster_path, overView: movieDetails.overview, imageController: controller)
                        
                    case .businessError(_, let message):
                        
                        Text(message ?? "An error occurred.")
                    }
                        
                    /*    switch controller.isLoading {
                            
                        case true:
                            ProgressView("Cargando Peliculas")
                            
                        case false:
                            
                            if let errormESSAGE = controller.errormESSAGE {
                                Text(errormESSAGE)
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                            } else {
                                
                                let listOfMovies = controller.movieList
                                
                                // Two types of views to handle how the information is displayed
                                if(tapBarController.isPhotoActive){
                                    ListVerticallyMovieViews(listOfMovies: listOfMovies ?? [],
                                                             imageController: controller,
                                                             onTapController: controller)
                                    .padding(10)
                                    
                                } else {
                                    
                                    ListHorizontalMovieViews(listOfMovies: listOfMovies ?? [], imageController: controller, onTapController: controller)
                                }
                                
                                
                            }
                        
                        
                    } */
                    
                
                    Spacer()
                    
                    ToolBarHeaderView(controller: tapBarController)
                        .padding()
                        .background(.ultraThinMaterial)
                        .frame(alignment: .bottom)
                
                    
                }
                .padding()
                
                Spacer()
                
            }
    
    }
    
    

}




#Preview {
    ContentView()
}
