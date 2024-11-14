//
//  MovieDetails.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 13/11/24.
//

import SwiftUI

struct MovieDetails: View {
    
    let titulo: String
    let votoAvarage: Float
    let fechaDeLanzamiento: String
    let posterPath: String
    let overView: String
    let imageController: MovieViewController
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                MovieImageDetails(titulo: titulo, voteAvarage: votoAvarage, fechaDeLanzamiento: fechaDeLanzamiento, posterPath: posterPath, imageController: imageController)
                    .frame(height: geometry.size.height * 0.5)
                    
                
                Text("Overview")
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .padding(20)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                
                Text(overView)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .minimumScaleFactor(0.2)
                
                
                
            }
        }
    }
}

struct MovieImageDetails: View {
    
    let titulo: String
    let voteAvarage: Float
    let fechaDeLanzamiento: String
    let posterPath: String
    let imageController: MovieViewController
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                
                MoviePosterView(posterPath: posterPath, controller: imageController)
                    .scaledToFill()
                    .clipped()
                    .blur(radius: 10)
                    .opacity(0.7)
                    .frame(height: geometry.size.height * 0.5)
                    
                
                VStack{
                    HStack {
                        
                        MoviePosterView(posterPath: posterPath, controller: imageController)
                            
                        
                        VStack(alignment: .leading) {
                            
                            Text(titulo)
                                .font(.title)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.2)
                            
                            Text(fechaDeLanzamiento)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.2)
                            
                            StarRatingView(rating: voteAvarage)
                                .padding(.top, 5)
                            
                        }
                        .padding(20)
                        
                    }
                }
                
                .cornerRadius(12)
                .padding()
            }
        }
    }
        
        
        
    }
    


#Preview {
    MovieDetails(titulo: "preview", votoAvarage: 7.8, fechaDeLanzamiento: "fecha ", posterPath: "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
                 overView: "" ,
                 imageController: MovieViewController())
}
