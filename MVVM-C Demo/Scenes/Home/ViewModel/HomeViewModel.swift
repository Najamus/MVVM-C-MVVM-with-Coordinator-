//
//  HomeViewModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import Foundation

class HomeViewModel {
    var model: HomeModel!
    var delegate: HomeCoordinatorDelegate

    init(delegate: HomeCoordinatorDelegate) {
        self.model = HomeModel()
        self.delegate = delegate
    }
    
    func getAttributedMessag() -> NSAttributedString {
        return model.message.attributedStringWithColor(
            strings: ["1.", "2.", "3.", "4.", "5."],
            color: .black,
            font: .systemFont(ofSize: 19, weight: .bold))
    }
    
    func gotoBack() {
        delegate.controllerDismissed()
    }
    
    func gotoDetailsViewController() {
        delegate.gotoDetailsViewController()
    }
}
