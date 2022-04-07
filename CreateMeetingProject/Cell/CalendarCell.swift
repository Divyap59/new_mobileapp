//
//  CalendarCell.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 24/03/22.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override var isSelected: Bool {
            didSet {
                self.dayLabel.backgroundColor = isSelected ? .systemPurple : .systemGray2
                self.dayLabel.textColor = isSelected ? .white : .black
            }
        }
    

}
