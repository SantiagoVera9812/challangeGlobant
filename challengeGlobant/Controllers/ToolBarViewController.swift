//
//  ToolBarViewController.swift
//  challengeGlobant
//
//  Created by Christian Santiago Vera Rojas on 8/11/24.
//

import Foundation

class ToolBarViewController: MovieViewController {
    
    @Published var isPhotoActive: Bool = true
        
    func printActiveButton(isPhotoActive: Bool) {
            if isPhotoActive {
                self.isPhotoActive = true
                
            } else {
                
                self.isPhotoActive = false
                
            }
        }
    
    
}
