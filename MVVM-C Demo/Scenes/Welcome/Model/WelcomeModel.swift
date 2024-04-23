//
//  WelcomeModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import Foundation

struct WelcomeModel {
    var title: String
    var message: String
    
    init() {
        self.title = "Welcome to MVVM-Coordinator Design Pattern"
        self.message = """
        Coordinator pattern provide an encapsolatios of navigation logic.
        
        Instead of pushing and presenting your view controller from other view controller, All the screen navigation will be managed by coordinator.
        """
    }
    
}
