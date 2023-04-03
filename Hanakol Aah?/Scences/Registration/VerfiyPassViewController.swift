//
//  VerfiyPassViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 03/04/2023.
//

import UIKit

class VerfiyPassViewController: UIViewController {

    @IBOutlet weak var verfiyYourEmailTitle: UILabel!
    @IBOutlet weak var codeSendLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var notSendLabel: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var CurvedView: UIView!
    @IBOutlet weak var verfiyBtn: GradientColorBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        CurvedView.cornerRedius = 20
        verfiyBtn.cornerRedius = 30
        
        verfiyYourEmailTitle.text = NSLocalizedString("verfiyEmailTitle", comment: "")
        codeSendLabel.text = NSLocalizedString("verfiySendCodoTo", comment: "")
        notSendLabel.text = NSLocalizedString("verfiyWasntSend", comment: "")
        resendBtn.setTitle(NSLocalizedString("verfiyResend", comment: ""), for: .normal)
        verfiyBtn.setTitle(NSLocalizedString("verfiy", comment: ""), for: .normal)
        
    }

}
