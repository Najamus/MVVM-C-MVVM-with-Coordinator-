//
//  WelcomeViewModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import Foundation

class WelcomeViewModel {
    
    var welcome: WelcomeModel
    let delegate: WelcomeCoordinatorDelegate

    init(delegate: WelcomeCoordinatorDelegate) {
        self.welcome = WelcomeModel()
        self.delegate = delegate
    }
    
    func gotoHomeViewController() {
        delegate.gotoHomeViewControler()
    }
    
}
