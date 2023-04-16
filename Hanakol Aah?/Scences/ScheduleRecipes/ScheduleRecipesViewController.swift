//
//  ScheduleRecipesViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 16/04/2023.
//

import UIKit

class ScheduleRecipesViewController: UIViewController {

    @IBOutlet var mealsTimeBtn: [UIButton]!
    
    @IBOutlet weak var mealsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        registerCollectionView()
    }
    
    func initUI(){
        for button in mealsTimeBtn{
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.orange.cgColor
            button.cornerRedius = 19
            button.setTitleColor(UIColor(named: "MiddleOrange"), for: .normal)
        }
        mealsTimeBtn[0].setTitle("Breakfast", for: .normal)
        mealsTimeBtn[1].setTitle("Lunch", for: .normal)
        mealsTimeBtn[2].setTitle("Dinner", for: .normal)
        mealsTimeBtn[0].addTarget(self, action: #selector(breakfastBtn(_:)), for: .touchUpInside)
        mealsTimeBtn[1].addTarget(self, action: #selector(lunchBtn(_:)), for: .touchUpInside)
        mealsTimeBtn[2].addTarget(self, action: #selector(dinnerBtn(_:)), for: .touchUpInside)
        
    }
    
    @objc func dinnerBtn(_ sender: UIButton){
        changePressed(sender: sender)
        let indexPath = IndexPath(item: 2, section: 0)
        mealsCollectionView.isPagingEnabled = false
        mealsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        mealsCollectionView.isPagingEnabled = true
    }
    @objc func lunchBtn(_ sender: UIButton){
        changePressed(sender: sender)
        let indexPath = IndexPath(item: 1, section: 0)
        mealsCollectionView.isPagingEnabled = false
        mealsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        mealsCollectionView.isPagingEnabled = true
    }
    @objc func breakfastBtn(_ sender: UIButton){
        changePressed(sender: sender)
        let indexPath = IndexPath(item: 0, section: 0)
        mealsCollectionView.isPagingEnabled = false
        mealsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        mealsCollectionView.isPagingEnabled = true
    }
    func changePressed(sender: UIButton){
        for button in mealsTimeBtn{
            button.backgroundColor = .systemBackground
            button.titleLabel?.textColor = UIColor(named: "MiddleOrange")
        }
        sender.backgroundColor = UIColor(named: "MiddleOrange")
        sender.setTitleColor(.white, for: .normal)
    }
    
}

extension ScheduleRecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func registerCollectionView(){
        mealsCollectionView.registerNib(cell: ScheduleCollectionViewCell.self)
        mealsCollectionView.delegate = self
        mealsCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mealsCollectionView.dequeue(indexPath: indexPath) as ScheduleCollectionViewCell

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mealsCollectionView.frame.width, height: mealsCollectionView.frame.height)
    }


}
