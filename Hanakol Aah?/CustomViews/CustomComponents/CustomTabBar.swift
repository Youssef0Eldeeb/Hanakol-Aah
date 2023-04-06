//
//  CustomTabBar.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 06/04/2023.
//

import UIKit

class CustomTabBar: UITabBar {
    
    // MARK: - Variables
    public var didTapButton: (() -> ())?
    
    public lazy var middleButton: UIButton! = {
        let middleButton = GradientColorBtn()
        
        middleButton.frame.size = CGSize(width: 70, height: 70)
        
        let image = UIImage(named: "HomeTabBar")!
        middleButton.setImage(image, for: .normal)
        middleButton.layer.cornerRadius = middleButton.frame.width / 2
        middleButton.contentMode = .scaleAspectFill
        
        middleButton.addTarget(self, action: #selector(self.middleButtonAction), for: .touchUpInside)
        
        self.addSubview(middleButton)
        
        return middleButton
    }()
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
        
        
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 80
        return sizeThatFits
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        middleButton.center = CGPoint(x: frame.width / 2, y: 5)
        
    }
    
    // MARK: - Actions
    @objc func middleButtonAction(sender: UIButton) {
        didTapButton?()
    }
    
    // MARK: - HitTest
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        
        return self.middleButton.frame.contains(point) ? self.middleButton : super.hitTest(point, with: event)
    }
}
