//
//  MovieRepository.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation


/*
class MovieViewController: ObservableObject {
    
    @Published var movieList: [MovieResponse] = []
    @Published var movieDetails: MovieDetailsResponse = MovieDetailsResponse(title: "", status: "", vote_average: 0.0, release_date: "", overview: "", genres: [], poster_path: "")
    @Published var isLoading: Bool = false
    @Published var errormESSAGE: String? = nil
    
    private let movieService = MovieService()
    
    func fetchMovieList(language: String) {
        
        isLoading = true
        errormESSAGE = nil
        
        movieService.getMoviesList(language: language) { [weak self] movieListResponse in
            
            DispatchQueue.main.async{
                
                self?.isLoading = false
                
                if let movies = movieListResponse {
                    
                    var listMoviesResponse: [MovieResponse] = []
                    
                    movies.results.forEach{movieFound in
                        
                        listMoviesResponse.append(movieFound)
                    }
                    
                    self?.movieList = listMoviesResponse
                    
                } else {
                    
                    self?.errormESSAGE = "Couldnt fetch movie list"
                    
                }
            }
        }
        
    }
    
    func fetchMovieDetailsList(idMovie: Int, language: String) {
        
        isLoading = true
        errormESSAGE = nil
        
        movieService.getMovieDetails(idMovie: idMovie, language: language) {[weak self] movieListResponse in
            
            DispatchQueue.main.async{
                
                self?.isLoading = false
                
                if let movies = movieListResponse {
                    
                    self?.movieDetails = movies
                    
                } else {
                    
                    self?.errormESSAGE = "Couldn't fetch movies detail"
                }
            }
        }
    }
}
*/
