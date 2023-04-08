//
//  HomeViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 06/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet var mealsTimeBtn: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    

    func initUI(){
        searchView.layer.borderWidth = 0.8
        searchView.layer.borderColor = UIColor.orange.cgColor
        searchView.cornerRedius = 20
        for button in mealsTimeBtn{
            button.layer.borderWidth = 0.8
            button.layer.borderColor = UIColor.orange.cgColor
            button.cornerRedius = 22
        }
    }

}
