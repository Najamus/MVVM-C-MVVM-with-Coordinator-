//
//  DetailsModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import Foundation

class DetailsModel {
    var title: String
    var message: String
    var code: String
    
    init() {
        title = "Coordinator Design Pattern"
        message = """
        First we need a Coordinator protocol that all our coordinators will conform to. Although there are lots of things you could do with this, I would suggest the bare minimum you need is:
        
        1. A property to store Input struct which contains all the required fields such as the navigation controller that’s being used to present view controllers. Even if you don’t show the navigation bar at the top, using a navigation controller is the easiest way to present view controllers.
        
        2. A property to store the Output struct which contains the defination of all the action methods which we need throught listener back to the parent coordinator.
        
        3. A start() method to make the coordinator take control. This allows us to create a coordinator fully and activate it only when we’re ready.
        
        4. A dismiss() method to perform some action when the coordinator is going to be dismissed such as popViewController.
        """
        code = """
        
        
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
        
        
        """
    }
}
