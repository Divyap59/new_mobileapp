//
//  MeetingTableViewController.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 22/03/22.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import FirebaseFirestore



class MeetingTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
//MARK: Variables
var arrData: [UserModel] = []
var plannedMeetingData: [PlannedMeetingModel] = []
    
var userImgArray:[UIImage] = [UIImage(named: "images")!,UIImage(named: "images")!,UIImage(named: "images")!,UIImage(named: "images")!]
var nameArray = ["Dima Fedorov","Deepa Tyagi","Divyani Rai","Diksha Kaur"]
    var iconArr:[UIImage] = [UIImage(systemName:"person.fill")!,UIImage(systemName:"person.fill")!,UIImage(systemName:"person.fill")!,UIImage(systemName:"person.fill")!]

var userImageArray:[UIImage] = [UIImage(named: "images")!,UIImage(named: "images")!,UIImage(named: "images")!,UIImage(named: "images")!]
var userNameArray = ["Dima Fedorov","Deepa Tyagi","Divyani Rai","Diksha Kaur"]
var dateArr = ["Date: 20.03.2022","Date: 21.03.2022","Date: 22.03.2022","Date: 25.03.2022"]
var timeArr = ["Time: 18:00","Time: 19:00","Time: 20:00","Time: 21:00"]
//var showDeleteAlertDelegate: DismissOptionShowDeleteAlert!
//var messages = [PopUpViewController]()
    
//MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatabaseRecords()
        getPlannedMeetingData()

    }
    
    
//MARK: Functions

//MARK: Get data for Invitation
    func getDatabaseRecords() {
        let db = Firestore.firestore()
            arrData = []  //  Empty the array
            db.collection("MeetingUser").getDocuments { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                } else {
                    for document in snapshot!.documents {
                        let data = document.data()
                        let newEntry = UserModel(
                            names: data["names"] as? String,
                            //name: data["name"] as? [Any] ?? [],
                            //meetingReason: data["meetingReason"] as? String,
                            userProfilePic: data["userImageIcon"] as? String)
                        self.arrData.append(newEntry)
                    }
                    print(self.arrData)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
    }
  
//MARK: Get data for PlannedMeeting
    func getPlannedMeetingData() {
        let db = Firestore.firestore()
            plannedMeetingData = []  //  Empty the array
            db.collection("PlannedMeeting").getDocuments { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                } else {
                    for document in snapshot!.documents {
                        let data = document.data()
                        let newEntrys = PlannedMeetingModel(
                            fullName: data["fullName"] as? String,
                            date: data["date"] as? String,
                            time: data["time"] as? String,
                            profileImage: data["profileImage"] as? String)
                        self.plannedMeetingData.append(newEntrys)
                    }
                    print(self.plannedMeetingData)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
    }
    
    
    
    
    
//MARK: Get ImageIcon using url
func getUrl(Completion:@escaping((String)->())) {

    let userID = Auth.auth().currentUser?.uid
    let db = Firestore.firestore().collection("PlannedMeeting").document(userID!)
            db.getDocument { (docSnapshot, error) in
                if error != nil {
                    return
                } else {
                    guard let snapshot = docSnapshot, snapshot.exists else {return}
                    guard let data = snapshot.data() else {return}
                    let imageUrl = data["profileImage"] as! String
                    Completion(imageUrl)

                }
            }
        }

    
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         arrData.count
        //return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
        let cell = tableView.dequeueReusableCell(withIdentifier: "invitationCell", for: indexPath) as! InvitationCell
        let user = arrData[indexPath.row]
        cell.nameLabel.text = user.names
        //cell.nameLabel.text = (user.name[indexPath.row] as! String)
        cell.iconView?.image = iconArr[indexPath.row]
        func getImage(Url:String){

             DispatchQueue.global().async {

                 let url = URL(string: Url)
                 if let data = try? Data(contentsOf: url!) {

                    DispatchQueue.main.async {

                          cell.userImageView.image = UIImage(data: data)

                            }
                        }
                    }
                }
        return cell
   }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedMeetingCell", for: indexPath) as! PlannedMeetingCell
            let user = plannedMeetingData[indexPath.row]
            cell.userNameLabel?.text = user.fullName
            cell.dateLabel?.text = user.date
            //dateArr[indexPath.row]
            cell.timeLabel?.text = user.time
            //timeArr[indexPath.row]
            //"Section \(indexPath.section) Row \(indexPath.row)"
            cell.dotImg?.image = UIImage(named: "dot")
            //cell.isUserInteractionEnabled = false
            
            func getImage(Url:String){

                 DispatchQueue.global().async {

                     let url = URL(string: Url)
                     if let data = try? Data(contentsOf: url!) {

                        DispatchQueue.main.async {

                              cell.userImgView.image = UIImage(data: data)

                                }
                            }
                        }
                    }
            return cell

        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "NEW INVITATIONS"
        }
        else if(section == 1){
            
            return "PLANNED MEETING"
        }
        else{
            return ""
        }
        }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier:
                                                                                
        "ConfirmMeetingVC") as! ConfirmMeetingVC
        
        if(indexPath.row == 0){
         self.navigationController?.pushViewController(secondViewController, animated: true)
    
        }
        else{
//            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let popupVC = storyboard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
//            popupVC.modalPresentationStyle = .popover
//            popupVC.preferredContentSize = CGSize(width:300, height:300)
//                    let pVC = popupVC.popoverPresentationController
//                    pVC?.permittedArrowDirections = .any
//                    pVC?.delegate = self
//                   // pVC?.sourceView = (sender as! UIView)
//                    pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//            if let vc = self.next(ofType: UIViewController.self) {
//                vc.present(popupVC, animated: true, completion: nil)
           // }
            //self.dismiss(animated: true, completion: nil)
        }
        
}
}
