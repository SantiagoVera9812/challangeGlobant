//
//  MovieListCells.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 6/11/24.
//

import Foundation
import SwiftUI


struct MovieListViewCell: View {
    
    let titulo: String
    let fechaDeLanzamiento: String
    let voteAvarage: Double
    
    var body: some View {
        
        VStack{
            HStack {
                
                MoviePosterView(posterPath: "/63xYQj1BwRFielxsBDXvHIJyXVm.jpg")
                
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
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}

struct StarRatingView: View {
    var rating: Double
    var maxRating: Double = 10 // Adjusted max rating to 5 for star ratings
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<Int(maxRating), id: \.self) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(index < Int(rating) ? .yellow : .gray)
                    .font(.system(size: 15))
            }
                    }
    }
}

struct HorizontalMovieView: View {
    
    let title: String
    let fechaLanzamiento: String
    
    var body: some View {
        
        VStack{
            VStack {
                
                MoviePosterView(posterPath: "/cdV45bSUfjUSCW2GRl7LX8ani8p.jpg")
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(fechaLanzamiento)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}
