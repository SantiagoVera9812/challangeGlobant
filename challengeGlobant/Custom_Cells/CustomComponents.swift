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
    
    var body: some View {
        
        getAsyncImage(posterPath: posterPath)
    }
}


struct ToolBarHeaderView: View {
    
    var body: some View {
        
        HStack{
            
            Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .padding()
                            
            
            Spacer()
            Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            }
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
