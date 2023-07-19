//
//  CreateNewPassViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/04/2023.
//

import UIKit

class CreateNewPassViewController: UIViewController {

    @IBOutlet weak var creatNewPassTitle: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassLabel: UILabel!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var saveBtn: GradientColorBtn!
    @IBOutlet weak var curveView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        curveView.cornerRedius = 20
        saveBtn.cornerRedius = 26
        
        creatNewPassTitle.text = NSLocalizedString("createPassTitle", comment: "")
        passLabel.text = NSLocalizedString("createPassPass", comment: "")
        confirmPassLabel.text = NSLocalizedString("createPassConfirmPass", comment: "")
        passTextField.placeholder = NSLocalizedString("createPassPass", comment: "")
        confirmPassTextField.placeholder = NSLocalizedString("createPassConfirmPass", comment: "")
        saveBtn.setTitle(NSLocalizedString("createPassSave", comment: ""), for: .normal)
        
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let controller = RegistrationViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
    
}
