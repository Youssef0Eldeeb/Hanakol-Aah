//
//  TextFieldView.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import Foundation
import UIKit

class TextFieldView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initialSetup()
    }
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.cornerRadius = frame.height / 2
    }
}
