//
//  OnboardingCollectionViewCell.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 30/03/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var onboardingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setImage(image: UIImage){
        onboardingImage.image = image
    }

}
