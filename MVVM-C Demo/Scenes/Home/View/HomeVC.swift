//
//  HomeVC.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 23/11/2023.
//

import UIKit

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
