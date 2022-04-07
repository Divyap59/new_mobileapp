//
//  PopUpViewController.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 04/04/22.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//MARK: IBOutlets
    
    @IBOutlet weak var cancelButton: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    
//MARK: IBACtions
    @IBAction func cancelMeetingBtn(_ sender: Any) {
       // cancelButton.isHidden = true
      //  mainView.isHidden = true
       
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//       {
//           let touch = touches.first
//           if touch?.view != self.mainView
//           { self.dismiss(animated: true, completion: nil) }
//       }

}
