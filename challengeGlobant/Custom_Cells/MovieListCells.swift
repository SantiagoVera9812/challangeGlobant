//
//  MovieListCells.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation
import SwiftUI


struct MovieListViewCell: View{
    
    let id: Int
    let titulo: String
    let fechaDeLanzamiento: String
    let voteAvarage: Float
    let posterPath: String
    let imageController: MovieViewController
    @ObservedObject var controller: MovieViewController
    
    var body: some View {
        
        VStack{
            HStack {
                
                MoviePosterView(posterPath: posterPath, controller: imageController)
                
                VStack(alignment: .leading) {
                    
                    Text(titulo)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    Text(fechaDeLanzamiento)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    StarRatingView(rating: voteAvarage)
                        .padding(.top, 5)
                    
                }
                .padding()
                
            }
        }
        .onTapGesture {
            controller.fetchMovieDetailsList(idMovie: id, language: "en")
        }
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 5)
        
    }
}

struct HorizontalMovieView: View {
    
    
    let id: Int
    let title: String
    let fechaLanzamiento: String
    let posterPath: String
    let imageController: MovieViewController
    @ObservedObject var controller: MovieViewController
    
    var body: some View {
        
        VStack{
            
            MoviePosterView(posterPath: posterPath, controller: imageController)
            VStack {
                
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(fechaLanzamiento)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            .padding()
        }
        .onTapGesture {
            controller.fetchMovieDetailsList(idMovie: id, language: "en")
        }
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}
