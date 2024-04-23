//
//  Coordinator.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    associatedtype InputType
    associatedtype OutputType

    var input: InputType  { get }
    var actions: OutputType { get }
    init(input: InputType, actions: OutputType)
    
    func start()
    func dismiss()
}

extension Coordinator {
    func dismiss() {
        fatalError("Dismiss is not implemented")
    }
}

