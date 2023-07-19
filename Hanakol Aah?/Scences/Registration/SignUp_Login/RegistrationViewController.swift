//
//  RegistrationViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    // IBOutlets:
    @IBOutlet weak var collectionVeiw: UICollectionView!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var canRegisterUsingLabel: UILabel!
    
    var isRegisterScreen:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    private func configView(){
        initUI()
        registerOptionsBtnUI()
        setupCollectionView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func keyboardWillShow(notification: NSNotification){
        self.view.frame.origin.y = CGFloat(0 - 100)
    }

    private func initUI(){
        canRegisterUsingLabel.text = NSLocalizedString("registerCanLoginUsing", comment: "")
        registerLabel.text = NSLocalizedString("registerCreateAccount", comment: "")
    }
    
    private func registerOptionsBtnUI(){
        googleBtn.cornerRedius = googleBtn.frame.size.width / 2
        facebookBtn.cornerRedius = facebookBtn.frame.size.width / 2
        appleBtn.cornerRedius = appleBtn.frame.size.width / 2

        googleBtn.layer.borderWidth = 2
        googleBtn.layer.borderColor = UIColor.orange.cgColor
        facebookBtn.layer.borderWidth = 2
        facebookBtn.layer.borderColor = UIColor.orange.cgColor
        appleBtn.layer.borderWidth = 2
        appleBtn.layer.borderColor = UIColor.orange.cgColor
    }

}



extension RegistrationViewController: UITextFieldDelegate{
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
