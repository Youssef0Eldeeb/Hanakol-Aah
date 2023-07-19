//
//  HomeVC+CollectionView.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 17/06/2023.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func registerCollectionView(){
        mealsCollectionView.registerNib(cell: HomeMealsCollectionViewCell.self)
        mealsCollectionView.delegate = self
        mealsCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mealsCollectionView.dequeue(indexPath: indexPath) as HomeMealsCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mealsCollectionView.frame.width, height: mealsCollectionView.frame.height)
    }
    
    
}
