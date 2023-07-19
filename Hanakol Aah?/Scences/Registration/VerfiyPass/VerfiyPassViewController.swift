//
//  VerfiyPassViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/04/2023.
//

import UIKit

class VerfiyPassViewController: UIViewController {

    @IBOutlet weak var verfiyYourEmailTitle: UILabel!
    @IBOutlet weak var codeSendLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var CurvedView: UIView!
    @IBOutlet weak var verfiyBtn: GradientColorBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        CurvedView.cornerRedius = 20
        verfiyBtn.cornerRedius = verfiyBtn.frame.size.height / 2
        
        verfiyYourEmailTitle.text = NSLocalizedString("verfiyEmailTitle", comment: "")
        codeSendLabel.text = NSLocalizedString("verfiySendCodoTo", comment: "")
        verfiyBtn.setTitle(NSLocalizedString("verfiy", comment: ""), for: .normal)
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func verfiyBtn(_ sender: UIButton) {
        let controller = RegistrationViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
    
}
