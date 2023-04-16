//
//  FridgeItemsCollectionViewCell.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 10/04/2023.
//

import UIKit

class FridgeItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var verticalCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        verticalCollectionView.registerNib(cell: FridgeItemsVerticalCollectionViewCell.self)
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        setupCompositionLayout()
    }

}

extension FridgeItemsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalCollectionView.dequeue(indexPath: indexPath) as FridgeItemsVerticalCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: verticalCollectionView.frame.width / 2 - 10, height: verticalCollectionView.frame.width / 2 - 10)
    }
    
    func setupCompositionLayout(){
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.35)), subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        verticalCollectionView.collectionViewLayout = layout
    }
    
}
