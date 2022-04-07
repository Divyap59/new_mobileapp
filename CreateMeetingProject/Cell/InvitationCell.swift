//
//  InvitationCell.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 22/03/22.
//

import Foundation
import UIKit
//import Kingfisher
import Firebase

class InvitationCell: UITableViewCell {
//MARK: IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var meetingReasonLabel: UILabel!
   // var db: Firestore!
//    var userModel: UserModel?{
//        didSet{
//            nameLabel.text = userModel?.name
//            meetingReasonLabel.text = userModel?.meetingReason
////            let url = URL(string: (userModel?.userProfilePic)!)
////            if let url = url as? URL{
////                        KingfisherManager.shared.retrieveImage(with: url as Resource, options: nil,progressBlock: nil){ (image,error,cache,imageURL) in
////                            self.userImageView.image = image
////                            self.userImageView.kf.indicatorType = .activity
////
////                        }
////
////        }
//        }
//    }
      
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
