//
//  FridgeViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 10/04/2023.
//

import UIKit

class FridgeViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet var foodItemsBtns: [UIButton]!
    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        registerCollectionView()
    }
    
    func initUI(){
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.orange.cgColor
        searchView.cornerRedius = 17
        for button in foodItemsBtns{
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.orange.cgColor
            button.cornerRedius = 19
            button.setTitleColor(UIColor(named: "MiddleOrange"), for: .normal)
        }
        foodItemsBtns[0].setTitle("Dinner", for: .normal)
        foodItemsBtns[1].setTitle("Lunch", for: .normal)
        foodItemsBtns[2].setTitle("Breakfast", for: .normal)
        foodItemsBtns[0].addTarget(self, action: #selector(vegetablesBtn(_:)), for: .touchUpInside)
        foodItemsBtns[1].addTarget(self, action: #selector(meatBtn(_:)), for: .touchUpInside)
        foodItemsBtns[2].addTarget(self, action: #selector(MacaroniBtn(_:)), for: .touchUpInside)
        
    }
    @objc func vegetablesBtn(_ sender: UIButton){
        changePressed(sender: sender)
//        let indexPath = IndexPath(item: 2, section: 0)
//        MealsCollectionView.isPagingEnabled = false
//        MealsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        MealsCollectionView.isPagingEnabled = true
    }
    @objc func meatBtn(_ sender: UIButton){
        changePressed(sender: sender)
        
        
    }
    @objc func MacaroniBtn(_ sender: UIButton){
        changePressed(sender: sender)
        
    }
    func changePressed(sender: UIButton){
        for button in foodItemsBtns{
            button.backgroundColor = .systemBackground
            button.titleLabel?.textColor = UIColor(named: "MiddleOrange")
        }
        sender.backgroundColor = UIColor(named: "MiddleOrange")
        sender.setTitleColor(.white, for: .normal)
    }

}

extension FridgeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func registerCollectionView(){
        horizontalCollectionView.registerNib(cell: FridgeItemsCollectionViewCell.self)
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = horizontalCollectionView.dequeue(indexPath: indexPath) as FridgeItemsCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: horizontalCollectionView.frame.width, height: horizontalCollectionView.frame.height)
    }
    
    
}
