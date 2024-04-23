//
//  DetailsViewModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import Foundation

class DetailsViewModel {
    var model: DetailsModel
    var delegate: DetailsCoordinatorDelegate

    init(delegate: DetailsCoordinatorDelegate) {
        self.model = DetailsModel()
        self.delegate = delegate
    }
    
    func getAttributedMessag() -> NSAttributedString {
        return model.message.attributedStringWithColor(
            strings: ["ViewController", "Coordinator", "Start", "1.", "2.", "3.", "4.", "5."],
            color: .black,
            font: .systemFont(ofSize: 19, weight: .bold))
    }
    
    func gotoBack() {
        delegate.controllerDismissed()
    }
    
    func gotoExampleViewController() {
        delegate.gotoExampleViewController()
    }
}
