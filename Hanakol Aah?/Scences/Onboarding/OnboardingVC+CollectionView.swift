//
//  OnboardingVC+CollectionView.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 17/06/2023.
//

import Foundation
import UIKit

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeue(indexPath: indexPath) as OnboardingCollectionViewCell
        
        if currentLanguage == "ar"{
            print(slides.reversed()[indexPath.row].image , "\n")
            cell.setImage(image: slides.reversed()[indexPath.row].image)
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }else{
            cell.setImage(image: slides[indexPath.row].image)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        titleLabel.text = slides[currentPage].title
        descriptionLabel.text = slides[currentPage].description
        print(currentPage," \n")
    }
    
}
