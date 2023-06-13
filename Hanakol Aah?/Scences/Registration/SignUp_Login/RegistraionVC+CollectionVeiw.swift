//
//  RegistraionVC+CollectionVeiw.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 13/06/2023.
//

import Foundation
import UIKit

extension RegistrationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func setupCollectionView(){
        self.collectionVeiw.delegate = self
        self.collectionVeiw.dataSource = self
        self.collectionVeiw.registerNib(cell: RegistrationCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionVeiw.frame.width, height: collectionVeiw.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if indexPath.row == 0 { // signUp cell
            cell = changeToSignUpCell(indexPath: indexPath)
        }else { // login cell
            cell = changeToLoginCell(indexPath: indexPath)
        }
        
        return cell
    }
    
    private func changeToSignUpCell(indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionVeiw.dequeueReusableCell(withReuseIdentifier: RegistrationCollectionViewCell.identifire, for: indexPath) as! RegistrationCollectionViewCell
        cell.passForgetContianer.isHidden = true
        cell.userNameContainer.isHidden = false
        cell.confirmPassContainer.isHidden = false
        cell.registerBtn.setTitle(NSLocalizedString("registerBtn", comment: ""), for: .normal)
        cell.haveAcountLabel.text = NSLocalizedString("registerHaveAcount?", comment: "")
        cell.loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
        
        cell.loginAndCreateAcountBtn.addTarget(self, action: #selector(slideToLoginCell(_:)), for: .touchUpInside)
        cell.registerBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return cell
    }
    private func changeToLoginCell(indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionVeiw.dequeueReusableCell(withReuseIdentifier: RegistrationCollectionViewCell.identifire, for: indexPath) as! RegistrationCollectionViewCell
        cell.userNameContainer.isHidden = true
        cell.confirmPassContainer.isHidden = true
        cell.passForgetContianer.isHidden = false
        cell.registerBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
        cell.loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerCreateAccount", comment: ""), for: .normal)
        cell.haveAcountLabel.text = NSLocalizedString("registerHavn'tAcount?", comment: "")
        
        cell.loginAndCreateAcountBtn.addTarget(self, action: #selector(slideToSignUpCell(_:)), for: .touchUpInside)
        cell.areForgetPassBtn.addTarget(self, action: #selector(goToForgetPassScreen(_:)), for: .touchUpInside)
        cell.registerBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return cell
    }
    @objc func slideToLoginCell(_ sender: UIButton){
        self.isRegisterScreen = false
        registerLabel.text = NSLocalizedString("registerLoginTitle", comment: "")
        
        let indexPath = IndexPath(item: 1, section: 0)
        collectionVeiw.isPagingEnabled = false
        self.collectionVeiw.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
        collectionVeiw.isPagingEnabled = true
        collectionVeiw.reloadData()
    }
    @objc func slideToSignUpCell(_ sender: UIButton){
        self.isRegisterScreen = true
        registerLabel.text = NSLocalizedString("registerCreateAccount", comment: "")
       
        let indexPath = IndexPath(item: 0, section: 0)
        collectionVeiw.isPagingEnabled = false
        self.collectionVeiw.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
        collectionVeiw.isPagingEnabled = true
        collectionVeiw.reloadData()
    }
    @objc func goToForgetPassScreen(_ sender: UIButton){
        let controller = ForgetPassViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true)
    }
    
    @objc func signUp(_ sender: UIButton){
        guard isRegisterScreen else {return}
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = collectionVeiw.cellForItem(at: indexPath) as! RegistrationCollectionViewCell
        let username = cell.userNameTextField.text
        let confirmedPass = cell.confirmPassTextField.text
        guard let email = cell.emailTextField.text,
              let password = cell.passwordTextField.text else {return}
        guard password == confirmedPass else { return }

        let userAuth = UserAuth(username: username, email: email, password: password)
        checkSignUp(userAuth)
        
    }
    
    @objc func login(_ sender: UIButton){
        guard !isRegisterScreen else {return}
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = collectionVeiw.cellForItem(at: indexPath) as! RegistrationCollectionViewCell
        guard let email = cell.emailTextField.text,
              let password = cell.passwordTextField.text else {return}

        let userAuth = UserAuth(email: email, password: password)
        checkLogin(userAuth)
    }
    private func checkSignUp(_ userAuth: UserAuth){
        FirebaseAuthentication.shared.signUp(userAuth: userAuth) { error in
            if let error = error{
                UIAlertController.showAlert(msg: error.localizedDescription, form: self)
            }
            guard error == nil else {return}
            UIAlertController.showAlert(msg: "Please check your email and verfiy your registration", form: self)
            //Repeated Code for 1 minute
            var count = 0
            Timer.scheduledTimer(withTimeInterval:5 , repeats: true) { timer in
                FirebaseAuthentication.shared.login(userAuth: userAuth) { error, isEmailVerified in
                    if error == nil {
                        if isEmailVerified{
                            timer.invalidate()
                            let controller = CustomTabBarController.instantiateVC(name: .Home)
                //            let profilecontroller = ProfileViewController.instantiateVC(name: .Profile)
                            controller.modalPresentationStyle = .fullScreen
                            controller.modalTransitionStyle = .flipHorizontal
                            
                            self.present(controller, animated: true) {
                                let profilecontroller = ProfileViewController.instantiateVC(name: .Profile)
                                profilecontroller.modalPresentationStyle = .fullScreen
                                controller.present(profilecontroller, animated: true)
                            }
                        }else{
                            count += 1
                            if count == 12{
                                timer.invalidate()
                            }
                        }
                        
                    }
                }
            }
            
            
            
        }
        
    }
    
    
    private func checkLogin(_ userAuth: UserAuth){
        FirebaseAuthentication.shared.login(userAuth: userAuth) { error, isEmailVerified in
            if error == nil{
                if isEmailVerified{
                    let controller = CustomTabBarController.instantiateVC(name: .Home)
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .flipHorizontal
                    self.present(controller, animated: true)
                }else{
                    UIAlertController.showAlert(msg: "Please check your email and verfiy your registration", form: self)
                }
            }else{
                UIAlertController.showAlert(msg: error!.localizedDescription, form: self)
            }
        }
    }
    
    
    
}
