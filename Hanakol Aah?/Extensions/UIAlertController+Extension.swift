//
//  UIAlertController+Extension.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 19/05/2023.
//

import Foundation
import UIKit

extension UIAlertController{
    static func showAlert(msg: String, form controller: UIViewController){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        controller.present(alert, animated: true)
    }
}
