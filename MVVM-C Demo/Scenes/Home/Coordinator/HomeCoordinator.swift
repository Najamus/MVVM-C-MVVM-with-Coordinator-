//
//  HomeCoordinator.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

protocol HomeCoordinatorDelegate {
    func controllerDismissed()
    func gotoDetailsViewController()
}

struct HomeCoordinatorInput {
    let navigationController: UINavigationController
}

struct HomeCoordinatorActions {
    let controllerDismissed: () -> Void
}

class HomeCoordinator: Coordinator, HomeCoordinatorDelegate {
    typealias InputType = HomeCoordinatorInput
    typealias OutputType = HomeCoordinatorActions
    
    let input: InputType
    let actions: OutputType
    
    required init(input: InputType, actions: OutputType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let vc = HomeVC()
        vc.viewModel = HomeViewModel(delegate: self)
        self.input.navigationController.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
        input.navigationController.popViewController(animated: true)
    }
    
    func controllerDismissed() {
        actions.controllerDismissed()
        dismiss()
    }
    
    func gotoDetailsViewController() {
        let input = DetailsCoordinatorInput(navigationController: input.navigationController)
        let actions = DetailsCoordinatorActions()
        let detailsCoordinator = DetailsCoordinator(input: input, actions: actions)
        detailsCoordinator.start()
    }
}
