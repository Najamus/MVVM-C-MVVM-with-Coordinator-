//
//  ExampleModel.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import Foundation

struct ExampleModel {
    var title: String
    var welcome: String
    var home: String
    
    init() {
        self.title = "Example"
        self.welcome = """
        
            /// WelcomeVC.swift
        
            class WelcomeVC: UIViewController {

                @IBOutlet weak var lblTitle: UILabel!
                @IBOutlet weak var lblMessage: UILabel!

                var viewModel: WelcomeViewModel!
                
                override func viewDidLoad() {
                    super.viewDidLoad()

                    setupView()
                }
                
                func setupView() {
                    lblTitle.text = viewModel.welcome.title
                    lblMessage.text = viewModel.welcome.message
                }

                @IBAction func btnGetStarted(_ sender: UIButton) {
                    viewModel.gotoHomeViewController()
                }
            }
        
        
        
            /// WelcomeViewModel.swift
        
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
        
        
            
            /// WelcomeCoordinator.swift
        
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
        
        """
        
        self.home = """
        
            /// HomeVC.swift
        
            class HomeVC: UIViewController {

                @IBOutlet weak var lblTitle: UILabel!
                @IBOutlet weak var lblMessage: UILabel!

                var viewModel: HomeViewModel!

                override func viewDidLoad() {
                    super.viewDidLoad()

                    setupView()
                }

                func setupView() {
                    lblTitle.text = viewModel.model.title
                    lblMessage.attributedText = viewModel.getAttributedMessag()
                }
                
                @IBAction func btnBack(_ sender: UIButton) {
                    viewModel.gotoBack()
                }
                
                @IBAction func btnNext(_ sender: UIButton) {
                    viewModel.gotoDetailsViewController()
                }
            }
        
        
        
            /// HomeViewModel.swift
        
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
        
        
        
            /// HomeCoordinator.swift
        
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

        
        """
    }
}
