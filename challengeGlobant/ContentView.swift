//
//  ContentView.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 28/10/24.
//

import SwiftUI



struct ContentView: View {
    
    
    
        @State private var inputText: String = ""
    @ObservedObject var controller = MovieViewController()
        var body: some View {
            GeometryReader { geometry in
                
                
                VStack {
                    
                    if controller.isLoading {
                        ProgressView("Cargando Peliculas")
                    } else if let errormESSAGE = controller.errormESSAGE {
                        
                        Text(errormESSAGE)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    } else {
                        
                        let listOfMovies = controller.movieList
                        
                        
                        //Dos tipos de vistas para manejar como se muestra la informacion, manejar desde movviecontrollview
                        
                        ListVerticallyMovieViews(listOfMovies: listOfMovies, imageController: controller,
                                                 onTapController: controller)
                                .padding()
                        
                        ListHorizontalMovieViews(listOfMovies: listOfMovies, imageController: controller, onTapController: controller)
                        
                        
                        Text(controller.movieDetails.overview)
                        
                    }
                    
                    TextField("Enter something...", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
        
                    ToolBarHeaderView()
                        .padding()
                        .frame(width: geometry.size.height * 0.1, height: geometry.size.height * 0.1)
                        .foregroundColor(.blue)
                        .background(.ultraThinMaterial)
                
                    
                }
                .padding()
            }
    
    }

}


#Preview {
    ContentView()
}
