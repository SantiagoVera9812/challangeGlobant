//
//  MovieViewController.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation
import SwiftUI


enum UiState<T>: Equatable {
  case initial
  case loading
  case empty
  case success(value: T)
  case businessError(_ code: Int, _ message: String?)
    
  static func == (lhs: UiState<T>, rhs: UiState<T>) -> Bool {
      switch (lhs, rhs) {
      case (.initial, .initial),
         (.loading, .loading),
         (.empty, .empty),
         (.success(value: _), .success(value: _)):
        return true
          
      case (.businessError(let lhsCode, let lhsMessage), .businessError(let rhsCode, let rhsMessage)):
        return lhsCode == rhsCode && lhsMessage == rhsMessage
          
      default:
        return false
      }
    }
}

class MovieViewController: ObservableObject {
    
    @Published var movieListState: UiState<[MovieResponse]> = .initial
    @Published var movieDetails: UiState<MovieDetailsResponse> = .initial 
    
    init(){
        
        fetchMovieList(page: 1, language: "en")
        
    }
    
    private let movieService = MovieService()
    
    func getPosterView(for posterPath: String) -> some View {
           return movieService.getAsyncImage(posterPath: posterPath)
       }
    
    func fetchMovieList(page: Int, language: String) {
        
        movieListState = .loading
        
        movieService.getMoviesList(page: page, language: language) { [weak self] movieListResponse in
            
            DispatchQueue.main.async{
                
                if let movies = movieListResponse {
                    
                    var listMoviesResponse: [MovieResponse] = []
                    
                    movies.results.forEach{movieFound in
                        
                        listMoviesResponse.append(movieFound)
                    }
                    
                    self?.movieListState = .success(value: listMoviesResponse)
                    
                } else {
                    
                    self?.movieListState = .businessError(0, "Couldnt fetch movie list")
                    
                }
            }
        }
        
    }
    
    func fetchMovieDetailsList(idMovie: Int, language: String) {
        
        movieListState = .initial
        
        movieDetails = .loading
        
        movieService.getMovieDetails(idMovie: idMovie, language: language) {[weak self] movieListResponse in
            
            DispatchQueue.main.async{
                
                
                if let movies = movieListResponse {
                    
                    print(movies.genres)
                    
                    self?.movieDetails = .success(value: movies)
                    
                } else {
                    
                    self?.movieListState = .businessError(0, "Couldnt fetch movie details")
                }
            }
        }
    }
    
    func defautlMovieDetailsValue() -> MovieDetailsResponse {
        
        return MovieDetailsResponse(title: "", status: "", vote_average: 0.0, release_date: "", overview: "", genres: [], poster_path: "")
        
    }
}


