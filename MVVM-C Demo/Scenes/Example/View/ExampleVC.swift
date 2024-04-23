//
//  ExampleVC.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import UIKit

class ExampleVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    
    var viewModel: ExampleViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        lblTitle.text = viewModel.model.title
        lblWelcome.text = viewModel.model.welcome
        lblHome.text = viewModel.model.home
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        viewModel.controllerDismissed()
    }
    
    @IBAction func btnRestart(_ sender: UIButton) {
        viewModel.gotoRootViewController()
    }
}
