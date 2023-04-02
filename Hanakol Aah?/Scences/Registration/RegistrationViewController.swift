//
//  RegistrationViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registrationCollectionVeiw: UICollectionView!
    
    @IBOutlet weak var registerBtn: GradientColorBtn!
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    
    
    
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
        }else if indexPath.row == 1{ // login cell
            cell.customizeLogin()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: registrationCollectionVeiw.frame.width, height: registrationCollectionVeiw.frame.height)
    }
    
}
