//
//  ListMovieViews.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation
import SwiftUI

struct ListVerticallyMovieViews: View {
    
    let listOfMovies: [MovieResponse]
    
    var body: some View {
        
        ScrollView{
            
            VStack {
                ForEach(listOfMovies, id: \.id) { movieFound in
                    MovieListViewCell(
                        titulo: movieFound.title,
                        fechaDeLanzamiento: movieFound.release_date,
                        voteAvarage: movieFound.vote_average,
                        posterPath: movieFound.poster_path
                    )
                }
            }
        }
        
    }
}

struct ListHorizontalMovieViews: View {
    
    let listOfMovies: [MovieResponse]
    
    var body: some View {
        ScrollView {
            GridLayout {
                ForEach(listOfMovies, id: \.id) { movieFound in
                            HorizontalMovieView(title: movieFound.title, fechaLanzamiento: movieFound.release_date, posterPath: movieFound.poster_path)
                        }
                    }
                }
                .padding()
    }
}

