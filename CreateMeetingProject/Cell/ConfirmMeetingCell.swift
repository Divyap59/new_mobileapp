//
//  ConfirmMeetingCell.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 24/03/22.
//

import UIKit

class ConfirmMeetingCell: UITableViewCell {

    
    @IBOutlet weak var circleLabel1: UILabel!
   
    @IBOutlet weak var straightLine1: UILabel!
    
    @IBOutlet weak var meetingReasonLabel: UILabel!
    @IBOutlet weak var meetingPurposeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circleLabel1.layer.masksToBounds = true
        self.circleLabel1.layer.cornerRadius = self.circleLabel1.bounds.width / 2
        self.circleLabel1.layer.borderWidth = 1.0
        self.circleLabel1.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
