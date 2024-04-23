//
//  ExampleCoordinator.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import UIKit

protocol ExampleCoordinatorDelegate {
    func controllerDismissed()
    func gotoRootViewController()
}

struct ExampleCoordinatorInput {
    let navigationController: UINavigationController
}

struct ExampleCoordinatorActions {
    let controllerDismissed: () -> Void
}

class ExampleCoordinator: Coordinator, ExampleCoordinatorDelegate {
    typealias InputType = ExampleCoordinatorInput
    typealias OutputType = ExampleCoordinatorActions
    
    var input: InputType
    var actions: OutputType
    
    required init(input: InputType, actions: OutputType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let vc = ExampleVC()
        vc.viewModel = ExampleViewModel(delegate: self)
        self.input.navigationController.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
        input.navigationController.popViewController(animated: true)
    }
    
    func controllerDismissed() {
        actions.controllerDismissed()
        dismiss()
    }
    
    func gotoRootViewController() {
        input.navigationController.popToRootViewController(animated: true)
    }
}
