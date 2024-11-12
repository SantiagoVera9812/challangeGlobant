//
//  CustomComponents.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation
import SwiftUI

struct MoviePosterView: View {
    
    let posterPath: String
    @ObservedObject var controller: MovieViewController
    
    
    
    var body: some View {
        
        controller.getPosterView(for: posterPath)
    }
}


struct ToolBarHeaderView: View {
    
    var body: some View {
        
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                        .padding()
                    
                    Spacer()
                    
                    
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60)
                        .padding()
                    
                }
                
                
            }
            
        }
        
}

struct StarRatingView: View {
    var rating: Float
    var maxRating: Float = 10 // Adjusted max rating to 5 for star ratings
    
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
