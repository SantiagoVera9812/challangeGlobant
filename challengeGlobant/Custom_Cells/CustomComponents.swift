//
//  CustomComponents.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation
import SwiftUI

protocol PageButton: View {
    var page: Binding<Int> { get }
    var controller: MovieViewController { get }
}

struct NextButton: PageButton {
    
    var page: Binding<Int>
    
    var controller: MovieViewController
    
    var body: some View {
        Button(action: {
            page.wrappedValue += 1
            controller.fetchMovieList(page: page.wrappedValue, language: "en")
            print(page)
        }) {
            Text("Next")
        }
    }
}

struct BeforeButton: PageButton {
    
    var page: Binding<Int>
    
    var controller: MovieViewController
    
    var body: some View {
        
        if page.wrappedValue > 1 {
            Button(action: {
                
                    page.wrappedValue -= 1
                    controller.fetchMovieList(page: page.wrappedValue, language: "en")
                    print(page)
                
            }) {
                Text("Back")
            }
        } else {
            
            EmptyView()
        }
    }
}

struct MoviePosterView: View {
    
    let posterPath: String
    @ObservedObject var controller: MovieViewController
    
    var body: some View {
        
        controller.getPosterView(for: posterPath)
    }
}


struct ToolBarHeaderView: View {
    
    @ObservedObject var controller: ToolBarViewController
    
        @State private var isPhotoActive: Bool = true
    
    var body: some View {
        
        VStack {
            
            let background = RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            
            HStack {
                Text(Image(systemName: "photo"))
                    .padding()
                    .background(background)
                    .foregroundColor(isPhotoActive ? .blue : .gray)
                    .onTapGesture {
                        
                        isPhotoActive = true
                        
                        controller.printActiveButton(isPhotoActive: isPhotoActive)
                        
                        
                        
                    }
                
                Text(Image(systemName: "star"))
                    .padding()
                    .background(background)
                    .foregroundColor(isPhotoActive ? .gray : .blue)
                    .onTapGesture {
                        
                        isPhotoActive = false
                        controller.printActiveButton(isPhotoActive: isPhotoActive)
                        
                    }
            }
            .font(.largeTitle)
            
        }.frame(alignment: .bottom)
            .padding(0)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
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

