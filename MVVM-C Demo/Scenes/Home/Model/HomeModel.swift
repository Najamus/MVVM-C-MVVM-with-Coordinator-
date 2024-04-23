//
//  HomeModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import Foundation

struct HomeModel {
    var title: String
    var message: String
    
    init() {
        self.title = "Coordinator Design Pattern"
        self.message = """
        Make sure to follow the all following points while implementing Coordinator Design Pattern with MVVM.
        
        1. We may have One/Multiple ViewControllers by Coordinator.
        
        2. Each Coordinator display its ViewController using a method generally called 'Start'.
        
        3. Each ViewModel has a delegate reference to its Coordinator.
        
        """
    }
}
