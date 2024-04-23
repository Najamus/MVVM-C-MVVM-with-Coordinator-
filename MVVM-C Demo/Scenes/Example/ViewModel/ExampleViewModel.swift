//
//  ExampleViewModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import Foundation

class ExampleViewModel {
    var model: ExampleModel
    var delegate: ExampleCoordinatorDelegate

    init(delegate: ExampleCoordinatorDelegate) {
        self.model = ExampleModel()
        self.delegate = delegate
    }
    
    func controllerDismissed() {
        delegate.controllerDismissed()
    }
    
    func gotoRootViewController() {
        delegate.gotoRootViewController()
    }
}
