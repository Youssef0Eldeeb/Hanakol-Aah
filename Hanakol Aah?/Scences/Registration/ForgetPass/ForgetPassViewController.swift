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
        emailTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{ return }
        self.view.frame.origin.y = 0 - keyboardSize.height
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
        
        FirebaseAuthentication.shared.resetPassword(email: emailTextField.text!) { error in
            if let error = error {
                UIAlertController.showAlert(msg: error.localizedDescription, form: self)
            }else{
                let controller = VerfiyPassViewController.instantiateVC(name: .Registration)
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .coverVertical
                self.present(controller, animated: true)
            }
            
        }
        
    }
    
}


extension ForgetPassViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.frame.origin.y = 0
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.frame.origin.y = 0
        textField.resignFirstResponder()
    }
}
