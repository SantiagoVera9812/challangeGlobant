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
    var totalResponses: Int
    
    var controller: MovieViewController
    
    var body: some View {
        
        if page.wrappedValue < totalResponses {
            Button(action: {
                
                    page.wrappedValue += 1
                    controller.fetchMovieList(page: page.wrappedValue, language: "en")
                    print(page)
                
            }) {
                Text("Next")
            }
        } else {
            
            EmptyView()
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
    var maxRating: Float = 10 
    
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

struct GenreListView: View {
    
    let genres: [Genre]
    
    var body: some View {
        
        HStack {
                    ForEach(genres.indices, id: \.self) { index in
                        Text(genres[index].name)
                        
                        if index < genres.count - 1 {
                            Text(".")
                        }
                    }
                }
                .padding()
            }
    }


struct HeaderView: PageButton {
    
    
    var page: Binding<Int>
    @State private var isItAFavourite: Bool = false
    
    
    var controller: MovieViewController
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Button(action: {
                    
                    controller.fetchMovieList(page: page.wrappedValue, language: "en")
                    controller.movieDetails = .initial
                    
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .padding()
                }
                
                
                Text("Detalles")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                
                Spacer()
                Image(systemName: isItAFavourite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .padding()
                    .onTapGesture {
                        
                        isItAFavourite.toggle()
                        
                    }
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            .background(Color.white)
        }
        .frame(maxWidth: .infinity)
    }
}

struct TextLabelInput: View {
    
    @Binding var inputText: String
    
    
    var body: some View {
        
        TextField("Enter something...", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
    }
}

#Preview {
    
    @Previewable @State var inputText: String = ""
    
    
    TextLabelInput(inputText: $inputText)
}
    
    


