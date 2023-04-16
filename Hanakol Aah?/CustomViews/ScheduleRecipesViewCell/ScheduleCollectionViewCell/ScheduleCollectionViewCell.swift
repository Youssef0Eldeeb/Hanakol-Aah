//
//  ScheduleCollectionViewCell.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 16/04/2023.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scheduleTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        scheduleTableView.registerNib(cell: ScheduleTableViewCell.self)
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
    }

}

extension ScheduleCollectionViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTableView.dequeue() as ScheduleTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
