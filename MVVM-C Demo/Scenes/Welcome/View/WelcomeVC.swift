//
//  WelcomeVC.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

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
