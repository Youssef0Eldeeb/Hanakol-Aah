//
//  ForgetPassViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/04/2023.
//

import UIKit

class ForgetPassViewController: UIViewController {

    @IBOutlet weak var forgetPassLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var SendBtn: UIButton!
    @IBOutlet weak var curvedView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        curvedView.cornerRedius = 20
        SendBtn.cornerRedius = SendBtn.frame.size.height / 2
        forgetPassLabel.text = NSLocalizedString("forgetPassTitle", comment: "")
        emailLabel.text = NSLocalizedString("forgetPassEmail", comment: "")
        emailTextField.placeholder = NSLocalizedString("forgetPassEmail", comment: "")
        SendBtn.setTitle(NSLocalizedString("forgetPassSend", comment: ""), for: .normal)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
        let controller = VerfiyPassViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true)
    }
    
}
