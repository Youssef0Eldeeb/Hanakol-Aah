//
//  RegistrationViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registrationCollectionVeiw: UICollectionView!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerBtn: GradientColorBtn!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var haveAcountLabel: UILabel!
    @IBOutlet weak var loginAndCreateAcountBtn: UIButton!
    @IBOutlet weak var canRegisterUsingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registrationCollectionVeiw.delegate = self
        registrationCollectionVeiw.dataSource = self
        initUI()
    }
    

    func initUI(){
        registrationCollectionVeiw.registerNib(cell: RegistrationCollectionViewCell.self)
        registerOptionsBtnUI()
        registerBtn.cornerRedius = registerBtn.frame.size.height / 2
        canRegisterUsingLabel.text = NSLocalizedString("registerCanLoginUsing", comment: "")
        registerLabel.text = NSLocalizedString("registerCreateAccount", comment: "")
        registerBtn.setTitle(NSLocalizedString("registerBtn", comment: ""), for: .normal)
        haveAcountLabel.text = NSLocalizedString("registerHaveAcount?", comment: "")
        loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
    }
    func registerOptionsBtnUI(){
        
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

extension RegistrationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = registrationCollectionVeiw.dequeue(indexPath: indexPath) as RegistrationCollectionViewCell
        if indexPath.row == 0 { // signUp cell
            cell.passForgetContianer.isHidden = true
            cell.userNameContainer.isHidden = false
            cell.confirmPassContainer.isHidden = false
            loginAndCreateAcountBtn.addTarget(self, action: #selector(slideToLoginCell(_:)), for: .touchUpInside)
            registerBtn.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
            
        }else if indexPath.row == 1{ // login cell
//            print("Login cell indexPath.row is \(indexPath.rfow)")
            cell.userNameContainer.isHidden = true
            cell.confirmPassContainer.isHidden = true
            cell.passForgetContianer.isHidden = false
            loginAndCreateAcountBtn.addTarget(self, action: #selector(slideToSignUpCell(_:)), for: .touchUpInside)
            cell.areForgetPassBtn.addTarget(self, action: #selector(goToForgetPassScreen(_:)), for: .touchUpInside)
            registerBtn.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        }
        return cell
    }
    @objc func slideToLoginCell(_ sender: UIButton){
        registerLabel.text = NSLocalizedString("registerLoginTitle", comment: "")
        registerBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
        haveAcountLabel.text = NSLocalizedString("registerHavn'tAcount?", comment: "")
        loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerCreateAccount", comment: ""), for: .normal)
        let indexPath = IndexPath(item: 1, section: 0)
        registrationCollectionVeiw.isPagingEnabled = false
        self.registrationCollectionVeiw.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
        registrationCollectionVeiw.isPagingEnabled = true
        registrationCollectionVeiw.reloadData()
    }
    @objc func slideToSignUpCell(_ sender: UIButton){
        registerLabel.text = NSLocalizedString("registerCreateAccount", comment: "")
        registerBtn.setTitle(NSLocalizedString("registerBtn", comment: ""), for: .normal)
        haveAcountLabel.text = NSLocalizedString("registerHaveAcount?", comment: "")
        loginAndCreateAcountBtn.setTitle(NSLocalizedString("registerLoginTitle", comment: ""), for: .normal)
        let indexPath = IndexPath(item: 0, section: 0)
        registrationCollectionVeiw.isPagingEnabled = false
        self.registrationCollectionVeiw.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
        registrationCollectionVeiw.isPagingEnabled = true
        registrationCollectionVeiw.reloadData()
    }
    @objc func goToForgetPassScreen(_ sender: UIButton){
        let controller = ForgetPassViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true)
    }
    
    @objc func goToProfile(_ sender: UIButton){
        let controller = CustomTabBarController.instantiateVC(name: .Home)
        let profilecontroller = ProfileViewController.instantiateVC(name: .Profile)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        
        present(controller, animated: true) {
            let profilecontroller = ProfileViewController.instantiateVC(name: .Profile)
            profilecontroller.modalPresentationStyle = .fullScreen
            controller.present(profilecontroller, animated: true)
        }

        
        
    }
    @objc func goToHome(_ sender: UIButton){
        let controller = CustomTabBarController.instantiateVC(name: .Home)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: registrationCollectionVeiw.frame.width, height: registrationCollectionVeiw.frame.height)
    }
    
}
