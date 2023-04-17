//
//  TipsViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 17/04/2023.
//

import UIKit

class TipsViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var tipsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        tipsTableView.delegate = self
        tipsTableView.dataSource = self
        tipsTableView.registerNib(cell: TipsTableViewCell.self)
        
    }
    
    func initUI(){
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.orange.cgColor
        searchView.cornerRedius = 17
    }

}
extension TipsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tipsTableView.dequeue() as TipsTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
