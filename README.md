# MVVM-C-MVVM-with-Coordinator-
Coordinator pattern provide an encapsolatios of navigation logic.                  Instead of pushing and presenting your view controller from other view controller, All the screen navigation will be managed by coordinator.

## Make sure to follow the all following points while implementing Coordinator Design Pattern with MVVM.
        
    - We may have One/Multiple ViewControllers by Coordinator.

    - Each Coordinator display its ViewController using a method generally called 'Start'.
        
    - Each ViewModel has a delegate reference to its Coordinator.

## First we need a Coordinator protocol that all our coordinators will conform to. Although there are lots of things you could do with this, I would suggest the bare minimum you need is:
        
    1. A property to store Input struct which contains all the required fields such as the navigation controller that’s being used to present view controllers. Even if you don’t show the navigation bar at the top, using a navigation controller is the easiest way to present view controllers.
        
    2. A property to store the Output struct which contains the defination of all the action methods which we need throught listener back to the parent coordinator.
        
    3. A start() method to make the coordinator take control. This allows us to create a coordinator fully and activate it only when we’re ready.
        
    4. A dismiss() method to perform some action when the coordinator is going to be dismissed such as popViewController.

## Base Coordinator
```swift
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
```

# Example
## Welcome Screen
### WelcomeCoordinator
```swift
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
```

### WelcomeVC
```swift
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
```

### WelcomeViewModel
```swift
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
```


## Home Screen
### HomeCoordinator
```swift
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
```

### HomeVC
```swift
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
```

### HomeViewModel
```swift
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
```

