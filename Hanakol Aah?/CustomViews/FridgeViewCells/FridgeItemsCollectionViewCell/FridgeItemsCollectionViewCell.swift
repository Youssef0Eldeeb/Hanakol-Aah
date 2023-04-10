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
    
}
