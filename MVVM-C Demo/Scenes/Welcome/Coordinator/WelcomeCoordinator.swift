//
//  WelcomeCoordinator.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

protocol WelcomeCoordinatorDelegate {
    func gotoHomeViewControler()
}

struct WelcomeCoordinatorInput {
    let navigationController: UINavigationController
}

struct WelcomeCoordinatorOutput {}

class WelcomeCoordinator: Coordinator, WelcomeCoordinatorDelegate {
    typealias InputType = WelcomeCoordinatorInput
    typealias OutputType = WelcomeCoordinatorOutput
    
    var input: InputType
    var actions: OutputType
    
    required init(input: InputType, actions: OutputType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let vc = WelcomeVC()
        vc.viewModel = WelcomeViewModel(delegate: self)
        input.navigationController.pushViewController(vc, animated: true)
    }

    func gotoHomeViewControler() {
        let input = HomeCoordinatorInput(navigationController: input.navigationController)
        let actions = HomeCoordinatorActions {
            print("------HomeViewController Dismissed------")
        }
        
        let homeCoordinator = HomeCoordinator(input: input, actions: actions)
        homeCoordinator.start()
    }
}
