//
//  HomeMealsCollectionViewCell.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 09/04/2023.
//

import UIKit

class HomeMealsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.registerNib(cell: HomeMealsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}
extension HomeMealsCollectionViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as HomeMealsTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 190))
        let footerView = CardView()
        footerView.frame = CGRect(x: 5, y: 5, width: footView.frame.width - 10, height: 180)
        footerView.backgroundColor = .white
        footView.addSubview(footerView)
        // UIView under image
        let imageView = GradientView()
        imageView.frame = CGRect(x: 0, y: 0, width: footerView.frame.width / 2, height: 180)
        imageView.cornerRedius = 20
        // add Meal image
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: 180)
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "addMeal")
        imageView.addSubview(image)
        //label
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        label.center = CGPoint(x: footerView.frame.width/2 + 92, y: 60)
        label.numberOfLines = 0
        label.text = "Add your own recipe"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        //add Button
        let button = GradientColorBtn()
        button.frame = CGRect(x: footerView.frame.width/2 + 35, y: 100, width: 120, height: 40)
        button.cornerRedius = 20
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        
        footerView.addSubview(imageView)
        footerView.addSubview(label)
        footerView.addSubview(button)
        tableView.tableFooterView = footView
    }
}
