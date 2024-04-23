//
//  DetailsCoordinator.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import Foundation
import UIKit

protocol DetailsCoordinatorDelegate {
    func controllerDismissed()
    func gotoExampleViewController()
}

struct DetailsCoordinatorInput {
    let navigationController: UINavigationController
}

struct DetailsCoordinatorActions {}

class DetailsCoordinator: Coordinator, DetailsCoordinatorDelegate {
    typealias InputType = DetailsCoordinatorInput
    typealias OutputType = DetailsCoordinatorActions
    
    var input: InputType
    var actions: OutputType
    
    required init(input: InputType, actions: OutputType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let vc = DetailsVC()
        vc.viewModel = DetailsViewModel(delegate: self)
        input.navigationController.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
        input.navigationController.popViewController(animated: true)
    }
    
    func controllerDismissed() {
        dismiss()
    }
    
    func gotoExampleViewController() {
        let input = ExampleCoordinatorInput(navigationController: input.navigationController)
        let actions = ExampleCoordinatorActions {
            print("-----ExampleViewCotroller Dismissed-----")
        }
        let exampleCoordinator = ExampleCoordinator(input: input, actions: actions)
        exampleCoordinator.start()
    }
}
