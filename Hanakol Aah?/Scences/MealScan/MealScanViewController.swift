//
//  MealScanViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 17/04/2023.
//

import UIKit

class MealScanViewController: UIViewController {

    @IBOutlet weak var scanView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scanView.layer.borderWidth = 1.5
        scanView.layer.borderColor = UIColor(named: "MiddleOrange")?.cgColor
        scanView.cornerRedius = 5
    }
    

}
