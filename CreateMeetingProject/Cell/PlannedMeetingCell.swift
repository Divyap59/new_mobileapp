//
//  PlannedMeetingCell.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 22/03/22.
//

import Foundation
import UIKit

protocol DismissOptionShowDeleteAlert {
    func showDeleteAlert()
}
class PlannedMeetingCell: UITableViewCell, UIPopoverPresentationControllerDelegate{
//MARK: IBOutlets

      
@IBOutlet weak var userImgView: UIImageView!
@IBOutlet weak var userNameLabel: UILabel!
@IBOutlet weak var dateLabel: UILabel!
@IBOutlet weak var timeLabel: UILabel!
@IBOutlet weak var dotImg: UIImageView!

//MARK: IBAction
    
    @IBAction func dotBtn(_ sender: Any) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupVC = storyboard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popupVC.modalPresentationStyle = .popover
        popupVC.preferredContentSize = CGSize(width:300, height:300)
                let pVC = popupVC.popoverPresentationController
                pVC?.permittedArrowDirections = .any
                pVC?.delegate = self
                pVC?.sourceView = (sender as! UIView)
                pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
        if let vc = self.next(ofType: UIViewController.self) {
            vc.present(popupVC, animated: true, completion: nil)
        }
       // present(popupVC, animated: true, completion: nil)
        
        
        
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let popupVC = storyboard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
//        popupVC.modalPresentationStyle = .popover
//        popupVC.preferredContentSize = CGSize(width:300, height:300)
//                let pVC = popupVC.popoverPresentationController
//                pVC?.permittedArrowDirections = .any
//                pVC?.delegate = self
//                pVC?.sourceView = (sender as! UIView)
//                pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//         present(popupVC, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        if userSignedInGlobal == "success"{
//            if let mainTabController = storyboard.instantiateViewController(withIdentifier: "MainTabController") as?  MainTabController{
       // window?.rootViewController = popupVC
               // window?.makeKeyAndVisible()
           // }
       // }
        
        
        
    }
    @IBOutlet weak var dotButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension UIResponder {
    func next<T:UIResponder>(ofType: T.Type) -> T? {
        let r = self.next
        if let r = r as? T ?? r?.next(ofType: T.self) {
            return r
        } else {
            return nil
        }
    }
}
