//
//  ChooseTimeSlotCell.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 24/03/22.
//

import UIKit

class ChooseTimeSlotCell: UITableViewCell {

    
    @IBOutlet weak var circleLabel4: UILabel!
    
    @IBOutlet weak var straightLine4: UILabel!
    
    @IBOutlet weak var chooseTimeSlotLabel: UILabel!
    
    @IBOutlet weak var dateLabel1: UILabel!
    @IBOutlet weak var timeLabel1: UILabel!
    
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    
    @IBOutlet weak var dateLabel3: UILabel!
    @IBOutlet weak var timeLabel3: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    

    
    @IBAction func buttonAction1(_ sender: Any) {
        button1.setImage(UIImage(named: "blackCircle"), for: .normal)
        button1.setImage(UIImage(named: "greenCircle"), for: .selected)
        if button1.isSelected == true {
            button1.isSelected = false
          }else {
            button1.isSelected = true
          }
        
    }
    
    
    @IBAction func buttonAction2(_ sender: Any) {
        button2.setImage(UIImage(named: "blackCircle"), for: .normal)
        button2.setImage(UIImage(named: "greenCircle"), for: .selected)
        if button2.isSelected == true {
            button2.isSelected = false
          }else {
            button2.isSelected = true
          }
      
    }
    
    @IBAction func buttonAction3(_ sender: Any) {
        button3.setImage(UIImage(named: "blackCircle"), for: .normal)
        button3.setImage(UIImage(named: "greenCircle"), for: .selected)
        if button3.isSelected == true {
            button3.isSelected = false
          }else {
            button3.isSelected = true
          }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circleLabel4.layer.masksToBounds = true
        self.circleLabel4.layer.cornerRadius = self.circleLabel4.bounds.width / 2
        self.circleLabel4.layer.borderWidth = 1.0
        self.circleLabel4.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

    
    

}
