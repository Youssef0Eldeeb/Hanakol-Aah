//
//  ProfileViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 05/04/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var edit01Btn: UIButton!
    @IBOutlet weak var confirm01Btn: UIButton!
    @IBOutlet weak var confirmBtnView: UIView!
    @IBOutlet weak var edit02Btn: UIButton!
    @IBOutlet weak var confirm02Btn: UIButton!
    @IBOutlet weak var confirm02BtnView: UIView!
    @IBOutlet weak var traditianalDietView: UIView!
    @IBOutlet weak var healthyDietView: UIView!
    @IBOutlet weak var vegetarianDietView: UIView!
    @IBOutlet weak var ketogenicDietView: UIView!
    @IBOutlet weak var tradionalDietCheckBtn: UIButton!
    @IBOutlet weak var healthyDietCheckBtn: UIButton!
    @IBOutlet weak var vegetarianDietCheckBtn: UIButton!
    @IBOutlet weak var ketogenicDietCheckBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    var dietType: DietType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    @IBAction func foodTypeBtn(_ sender: UIButton) {
        tradionalDietCheckBtn.backgroundColor = .none
        healthyDietCheckBtn.backgroundColor = .none
        vegetarianDietCheckBtn.backgroundColor = .none
        ketogenicDietCheckBtn.backgroundColor = .none
        
//        sender.backgroundColor = sender.backgroundColor == .orange ? .none : .orange
        sender.backgroundColor = .orange
        
        
        switch sender.tag {
        case 0:
            dietType = .traditional
        case 1:
            dietType = .healthy
        case 2:
            dietType = .vegetarian
        case 3:
            dietType = .ketogenic
        default:
            break
        }
        
    }
    
    func initUI(){
        profileImage.cornerRedius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.orange.cgColor
        confirmBtnView.isHidden = true
        confirm02BtnView.isHidden = true
        
        tradionalDietCheckBtn.layer.borderWidth = 2
        tradionalDietCheckBtn.layer.borderColor = UIColor.orange.cgColor
        healthyDietCheckBtn.layer.borderWidth = 2
        healthyDietCheckBtn.layer.borderColor = UIColor.orange.cgColor
        vegetarianDietCheckBtn.layer.borderWidth = 2
        vegetarianDietCheckBtn.layer.borderColor = UIColor.orange.cgColor
        ketogenicDietCheckBtn.layer.borderWidth = 2
        ketogenicDietCheckBtn.layer.borderColor = UIColor.orange.cgColor
        
        
        doneBtn.addTarget(self, action: #selector(dissmisScreen), for: .touchUpInside)
        
        edit01Btn.addTarget(self, action: #selector(editFamilyNum(_:)), for: .touchUpInside)
        confirm01Btn.addTarget(self, action: #selector(confirmEditFamilyNum(_:)), for: .touchUpInside)
        
        edit02Btn.addTarget(self, action: #selector(editFoodType(_:)), for: .touchUpInside)
        confirm02Btn.addTarget(self, action: #selector(confirmFoodType(_:)), for: .touchUpInside)
    }
    
    @objc func editFamilyNum(_ sender: UIButton){
        confirmBtnView.isHidden = false
        edit01Btn.isHidden = true
    }
    @objc func confirmEditFamilyNum(_ sender: UIButton){
        edit01Btn.isHidden = false
        confirmBtnView.isHidden = true
    }
    
    @objc func editFoodType(_ sender: UIButton){
        edit02Btn.isHidden = true
        confirm02BtnView.isHidden = false
        traditianalDietView.isHidden = false
        healthyDietView.isHidden = false
        vegetarianDietView.isHidden = false
        ketogenicDietView.isHidden = false
    }
    @objc func confirmFoodType(_ sender: UIButton){
        edit02Btn.isHidden = false
        confirm02BtnView.isHidden = true
        
        switch dietType{
        case .traditional:
            healthyDietView.isHidden = true
            vegetarianDietView.isHidden = true
            ketogenicDietView.isHidden = true
        case .healthy:
            traditianalDietView.isHidden = true
            vegetarianDietView.isHidden = true
            ketogenicDietView.isHidden = true
        case .vegetarian:
            traditianalDietView.isHidden = true
            healthyDietView.isHidden = true
            ketogenicDietView.isHidden = true
        case .ketogenic:
            traditianalDietView.isHidden = true
            healthyDietView.isHidden = true
            vegetarianDietView.isHidden = true
        case .none:
            break
        }
    }
    @objc func dissmisScreen(_ sender: UIButton){
        dismiss(animated: true)
    }

}

enum DietType{
    case traditional
    case healthy
    case vegetarian
    case ketogenic
}
