//
//  DetailsVC.swift
//  MVVM-C Demo
//
//  Created by Najam Us Saqib on 24/11/2023.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblCode: UILabel!

    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        lblTitle.text = viewModel.model.title
        lblMessage.attributedText = viewModel.getAttributedMessag()
        lblCode.text = viewModel.model.code
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        viewModel.gotoBack()
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        viewModel.gotoExampleViewController()
    }

}
