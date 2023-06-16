//
//  HomeViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 06/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet var mealsTimeBtn: [UIButton]!
    
    @IBOutlet weak var mealsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        registerCollectionView()
    }
    
    func initUI(){
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.orange.cgColor
        searchView.cornerRedius = 17
        for button in mealsTimeBtn{
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.orange.cgColor
            button.cornerRedius = 19
            button.setTitleColor(UIColor(named: "MiddleOrange"), for: .normal)
        }
        mealsTimeBtn[0].setTitle("Dinner", for: .normal)
        mealsTimeBtn[1].setTitle("Lunch", for: .normal)
        mealsTimeBtn[2].setTitle("Breakfast", for: .normal)
        mealsTimeBtn[0].addTarget(self, action: #selector(dinnerBtn(_:)), for: .touchUpInside)
        mealsTimeBtn[1].addTarget(self, action: #selector(lunchBtn(_:)), for: .touchUpInside)
        mealsTimeBtn[2].addTarget(self, action: #selector(breakfastBtn(_:)), for: .touchUpInside)
        
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

