//
//  StraightLineView.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 02/04/2023.
//

import Foundation
import UIKit

class StraightLineViewRegisterScreen: UIView{
    override func draw(_ rect: CGRect) {
        let pathLift = UIBezierPath()
        pathLift.move(to: CGPoint(x: 0, y: 18))
        pathLift.addLine(to: CGPoint(x: 100, y: 18))
        pathLift.stroke()
        
        let pathRight = UIBezierPath()
        pathRight.move(to: CGPoint(x: 0, y: 18))
        pathRight.addLine(to: CGPoint(x: 18, y: 100))
        pathRight.stroke()

    }
}
