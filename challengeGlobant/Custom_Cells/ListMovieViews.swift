//
//  ListMovieViews.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation
import SwiftUI

struct ListScrollMovieView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct ListVerticallyMovieViews: View {
    
    let listOfMovies: [MovieResponse]
    let imageController: MovieViewController
    let onTapController: MovieViewController
    
    var body: some View {
        
        ScrollView{
            
            VStack {
                ForEach(listOfMovies, id: \.id) { movieFound in
                    MovieListViewCell(
                        id: movieFound.id,
                        titulo: movieFound.title,
                        fechaDeLanzamiento: movieFound.release_date,
                        voteAvarage: movieFound.vote_average,
                        posterPath: movieFound.poster_path,
                        imageController: imageController,
                        controller: onTapController
                        
                    )
                    
                    Spacer(minLength: 20)
                    
                }
            }
            
        }
        
    }
}

struct ListHorizontalMovieViews: View {
    
    let listOfMovies: [MovieResponse]
    let imageController: MovieViewController
    let onTapController: MovieViewController
    
    var body: some View {
        ScrollView {
            GridLayout {
                ForEach(listOfMovies, id: \.id) { movieFound in
                            HorizontalMovieView(
                                id: movieFound.id,
                                title: movieFound.title,
                                fechaLanzamiento: movieFound.release_date,
                                posterPath: movieFound.poster_path,
                                imageController: imageController,
                                controller: onTapController)
                        }
                    }
                }
                .padding()
    }
}

