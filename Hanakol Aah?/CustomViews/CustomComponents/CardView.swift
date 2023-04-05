//
//  CardView.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 05/04/2023.
//

import Foundation
import UIKit

class CardView: UIView{
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
        layer.shadowOpacity = 0.2
        layer.cornerRadius = 20
    }
}
