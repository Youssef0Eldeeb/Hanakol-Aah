//
//  UIView+Extension.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 30/03/2023.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRedius: CGFloat{
        get{
            return self.cornerRedius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

 class GradientView: UIView {
    override class var layerClass: AnyClass { CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func configure() {
        gradientLayer.colors = [#colorLiteral(red: 0.9607843137, green: 0.5529411765, blue: 0.1803921569, alpha: 1), #colorLiteral(red: 0.9490196078, green: 0.4156862745, blue: 0.1176470588, alpha: 1), #colorLiteral(red: 0.9490196078, green: 0.3058823529, blue: 0.1176470588, alpha: 1)].map { $0.cgColor }
//        gradientLayer.locations = [0, 0.25, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}
 class GradientColorBtn: UIButton {
    override class var layerClass: AnyClass { CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func configure() {
        gradientLayer.colors = [#colorLiteral(red: 0.9607843137, green: 0.5529411765, blue: 0.1803921569, alpha: 1), #colorLiteral(red: 0.9490196078, green: 0.4156862745, blue: 0.1176470588, alpha: 1), #colorLiteral(red: 0.9490196078, green: 0.3058823529, blue: 0.1176470588, alpha: 1)].map { $0.cgColor }
//        gradientLayer.locations = [0, 0.25, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}
