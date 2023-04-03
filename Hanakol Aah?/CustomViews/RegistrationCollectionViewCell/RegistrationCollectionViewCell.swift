//
//  RegistrationCollectionViewCell.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import UIKit

class RegistrationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var userNameContainer: TextFieldView!
    @IBOutlet weak var confirmPassContainer: TextFieldView!
    @IBOutlet weak var passForgetContianer: UIView!
    @IBOutlet weak var areForgetPassBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    func initUI(){
        userNameTextField.placeholder = NSLocalizedString("registerUsername", comment: "")
        emailTextField.placeholder = NSLocalizedString("registerEmail", comment: "")
        passwordTextField.placeholder = NSLocalizedString("registerPassword", comment: "")
        confirmPassTextField.placeholder = NSLocalizedString("registerConfirmPass", comment: "")
        areForgetPassBtn.setTitle(NSLocalizedString("registerForgetPass", comment: ""), for: .normal)
    }
    

}
