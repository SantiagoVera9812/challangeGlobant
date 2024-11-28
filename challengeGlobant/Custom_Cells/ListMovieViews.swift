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
            .scaledToFit()
            
        }
        
    }
}

struct ListHorizontalMovieViews: View {
    let listOfMovies: [MovieResponse]
  let imageController: MovieViewController
  let onTapController: MovieViewController
  // Define the number of columns for the grid
  let columns = [
    GridItem(.flexible(), spacing: 5),
    GridItem(.flexible(), spacing: 5)
  ]
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 5) { // Uniform spacing between rows
        ForEach(listOfMovies, id: \.id) { movieFound in
          VStack {
            HorizontalMovieView(
              id: movieFound.id,
              title: movieFound.title,
              fechaLanzamiento: movieFound.release_date,
              posterPath: movieFound.poster_path,
              imageController: imageController,
              controller: onTapController
            )
            .aspectRatio(2/3, contentMode: .fill) // Fixed aspect ratio for the images
            .cornerRadius(12) // Rounded corners for each movie poster
            .shadow(radius: 6) // Add shadow for a sleek look
          }
        }
      }
      .padding(5) // Padding around the grid
      .scaledToFit()
    }
  }
}

#Preview{
    
    @ObservedObject var controller = MovieViewController()
    @ObservedObject var tapBarController = ToolBarViewController()
    
    var movieResponse = [MovieResponse(id: 1, release_date: "", title: "", vote_average: 1.2, poster_path: "")]
    
    ListVerticallyMovieViews(listOfMovies: movieResponse, imageController: controller, onTapController: tapBarController)
}
