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
    @IBOutlet weak var registerBtn: GradientColorBtn!
    @IBOutlet weak var loginAndCreateAcountBtn: UIButton!
    @IBOutlet weak var haveAcountLabel: UILabel!
    
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
        registerBtn.setTitle(NSLocalizedString("registerBtn", comment: ""), for: .normal)
        registerBtn.cornerRedius = registerBtn.frame.size.height / 2
        haveAcountLabel.text = NSLocalizedString("registerHaveAcount?", comment: "")
        loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
    }
    

}
