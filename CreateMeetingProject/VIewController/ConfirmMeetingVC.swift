//
//  ConfirmMeetingVC.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 24/03/22.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import FirebaseFirestore


class ConfirmMeetingVC: UIViewController,UIPopoverPresentationControllerDelegate {
    
//MARK: Variables
    var arrData: [UserModel] = []
    var arrData1: [String: Any] = ["name": "Diya"]
 var circularArr1 = ["1","2","3"]
 var circularArr2 = ["2","2","3"]
 var circularArr3 = ["3","2","3"]
    
 var meetingReasonArr1 = ["Meeting reasons","Meeting type","Housekeeping"]
 var meetingReasonArr2 = ["Meeting type","Meeting type","Housekeeping"]
 var meetingReasonArr3 = ["Housekeeping","Meeting type","Housekeeping"]
    
 var meetingDescArr1 = ["Get to know each other","   In-person","  Coffee on me"]
 var meetingDescArr2 = ["   In-person","   In-person","  Coffee on me"]
 var meetingDescArr3 = ["  Coffee on me","   In-person","  Coffee on me"]
 var straightLineArr = [".",".","."]
    var db = Firestore.firestore()

//MARK: IBOutlets
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
//MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSource()
        getDatabaseRecords()
       // postData()
       // db = Firestore.firestore()
        
        
//        let databaseRef = Database.database().reference()
//        databaseRef.child("ConfirmMeetingData").queryOrderedByKey().observe(.childAdded, with: {
//            snapshot in
//           // let name = snapshot.value!["Pathak Divya"] as! String
//           // let name = snapshot.value["name"] as? String
//
//            let newName = snapshot.value as? [String: Any]
//            _ = newName?["name"]  as? String
//
//            let newDate = snapshot.value as? [String: Any]
//            _ = newDate?["date"] as? String
//
//            let newTime = snapshot.value as? [String: Any]
//            _ = newTime?["time"] as? String
//
//            self.arrData.insert(UserModel(name: "Divya", names: "Diya", nameWithDesc: "invites you to the ninja talks", meetingReason: "Collaborate", userProfilePic: "kjfngjfngj", meetingType: "dgnfmgbdfg", houseKeeping: "erewtrr", date: "05.04.2022", date2: "fgfggdg", date3: "ghgjghk", time: "10:30", time2: "gdhdh", time3: "gghfgh", profileDesc: "fghfg"), at: 0)
//        })

        //tableView.reloadData()
        //postData()
        
        // Do any additional setup after loading the view.
    }
    
//    required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
    

//MARK: Functions
    func setDelegateAndDataSource(){
        tableView.delegate = self
        tableView.dataSource = self
    }

//MARK: IBAction
    
@IBAction func confirmButton(_ sender: Any) {
   // sendData()
   // Database.database().reference().child("RSVP").child("yourchild name").setValue(["name": "DIvya", "ID": "1"])
//    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//    let popupVC = storyboard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
//    popupVC.modalPresentationStyle = .popover
//    popupVC.preferredContentSize = CGSize(width:300, height:300)
//            let pVC = popupVC.popoverPresentationController
//            pVC?.permittedArrowDirections = .any
//            pVC?.delegate = self
//            pVC?.sourceView = (sender as! UIView)
//            pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//    present(popupVC, animated: true, completion: nil)
    
   // sendData()
   // postData()
    
    
   // let collection = Firestore.firestore().collection("meeting")

    // ====== ADD THIS ======
//    let restaurant = UserModel(
//      names: "names",
//      meetingReason: "meetingReason",
//      meetingType: "meetingType"
//
//    )

  //  collection.addDocument(data: )
    }
    
    
    
    
//MARK: Get data
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
                                meetingReason: data["meetingReason"] as? String,
                                userProfilePic: data["userImageIcon"] as? String,
                                meetingType: data["meetingType"] as? String,
                                houseKeeping: data["housekeeping"] as? String,
                                date: data["date"] as? String,
                                date2: data["date2"] as? String,
                                date3: data["date3"] as? String,
                                time: data["time"] as? String,
                                time2: data["time2"] as? String,
                                time3: data["time3"] as? String,
                                profileDesc: data["profileDesc"] as? String
                            )
                            self.arrData.append(newEntry)
                        }
                        print(self.arrData)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
        }
    
//MARK: Get ImageIcon using url
    func getUrl(Completion:@escaping((String)->())) {

        let userID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore().collection("MeetingUser").document(userID!)
                db.getDocument { (docSnapshot, error) in
                    if error != nil {
                        return
                    } else {
                        guard let snapshot = docSnapshot, snapshot.exists else {return}
                        guard let data = snapshot.data() else {return}
                        let imageUrl = data["userImageIcon"] as! String
                        Completion(imageUrl)

                    }
                }
            }
    
//MARK: Post Data on Firestore Database
    func sendData(){
        db.collection("ConfirmMeeting").document("Data").setData([
            "name": "Peacock",
            "type": "Herbivore",
            "colors": ["Green", "White", "Blue", "Black"]
        ])
//        db.collection("animal").document("mammal").setData([
//            "name": "Bat",
//            "type": "Herbivore",
//            "norturnal": true,
//            "colors": ["Brown", "Black"]
//        ], merge: true)
    }
    
    func postData(){
        
        let name = "Pathak Divya"
        let date = "05.04.2022"
        let time = "12:40"
        let post: [String : AnyObject] = ["name": name, "date": date,"time": time] as [String: AnyObject]
        let databaseRef = Database.database().reference()
        databaseRef.child("ConfirmMeetingData").child("Data").setValue(post)
        // databaseRef.child("Diksha").childByAutoId().setValue(post)
       // db.collection("Diviya").document("MeetingData").setData(["name":"Pathak Divya", "date":"05.04.2022"])
    }
    
    
}


    
    


//MARK: Extension for TableView
extension ConfirmMeetingVC: UITableViewDelegate, UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationDescCell", for: indexPath) as! InvitationDescCell
            let user = arrData[indexPath.row]
            cell.userDescNameLabel?.text  = user.names
           // cell.userDescNameLabel?.text  = (arrData[indexPath.row][user.names] as String)
            
            //db.collection("ConfirmMeetingData").document("data").setData([cell.userDescNameLabel?.text: user.names,cell.profileLabel?.text: user.profileDesc])
            cell.profileLabel?.text = user.profileDesc
            func getImage(Url:String){

                 DispatchQueue.global().async {

                     let url = URL(string: Url)
                     if let data = try? Data(contentsOf: url!) {

                        DispatchQueue.main.async {

                              cell.userDescImage.image = UIImage(data: data)

                                }
                            }
                        }
               
                    }
            return cell
        }
        
        else if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmMeetingCell", for: indexPath) as! ConfirmMeetingCell
               let user = arrData[indexPath.row]
                cell.circleLabel1?.text = circularArr1[indexPath.row]
                cell.straightLine1?.text = straightLineArr[indexPath.row]
                cell.meetingPurposeLabel?.text = user.meetingReason
            db.collection("Meeting_Create").document("ConfirmData").setData(arrData1)
           // sendData()
            
           // db.collection("CreateMeetingData").document("data").setData(["Name": "Divya","MeetingReason":"Collaborate"])
            

           // let refs = Database.database().reference().child("List_of_Data")

            //refs = self.db.collection("sdghfdgfsdh").addDocument(data: [cell.meetingPurposeLabel?.text = user.meetingReason])
            
            
            // cell.meetingPurposeLabel?.text = user.meetingReason
 //            db.collection("CreateMeetingData").document("data").setValue(["Name": "Divya","MeetingReason": "Collaboration"], forKey: "Divya") as? String
             //let databaseRef = Database.database().reference()
            // databaseRef.child("CreateMeetin
               // cell.meetingReasonLabel?.text = meetingReasonArr1[indexPath.row]gData").child("data").setValue([cell.meetingPurposeLabel?.text = user.meetingReason])
           // db.collection("ConfirmMeetingData").document("data").setData([cell.meetingPurposeLabel?.text = user.meetingReason])
           // databaseRef.child("CreateMeeting").child("data").setValue(cell.meetingPurposeLabel?.text = user.meetingReason) as! NSString
               // cell.meetingPurposeLabel?.text = user.meetingReason

           // postData()
            
            return cell
            
            
        }
        
        else if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmMeetingCell", for: indexPath) as! ConfirmMeetingCell
               let user = arrData[indexPath.row]
            
                cell.circleLabel1?.text = circularArr2[indexPath.row]
                cell.straightLine1?.text = straightLineArr[indexPath.row]
                cell.meetingReasonLabel?.text = meetingReasonArr2[indexPath.row]
                cell.meetingPurposeLabel?.text = user.meetingType
            //meetingDescArr2[indexPath.row]
           // postData()
            
            return cell
            
            
        }
        else if(indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmMeetingCell", for: indexPath) as! ConfirmMeetingCell
            
                let user = arrData[indexPath.row]
                cell.circleLabel1?.text = circularArr3[indexPath.row]
                cell.straightLine1?.text = straightLineArr[indexPath.row]
                cell.meetingReasonLabel?.text = meetingReasonArr3[indexPath.row]
               // cell.meetingPurposeLabel?.text = user.houseKeeping
               cell.meetingPurposeLabel?.text  = arrData[indexPath.row] as? String
            
            //meetingDescArr3[indexPath.row]
            
            //postData()
            return cell
            
            
        }
        
        else if(indexPath.section == 4){

            let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseTimeSlotCell", for: indexPath) as! ChooseTimeSlotCell
            let user = arrData[indexPath.row]
            cell.circleLabel4?.text = "4"
            cell.straightLine4?.text = "."
            cell.chooseTimeSlotLabel?.text = "Choose time slots:"
            cell.dateLabel1?.text = user.date
            cell.timeLabel1?.text = user.time
            cell.timeLabel2?.text = user.time2
            cell.timeLabel3?.text = user.time3
            cell.dateLabel2?.text = user.date2
            cell.dateLabel3?.text = user.date3
            cell.button1?.setBackgroundImage(UIImage(named: "blackCircle"), for: .normal)
            cell.button2?.setBackgroundImage(UIImage(named: "blackCircle"), for: .normal)
            cell.button3?.setBackgroundImage(UIImage(named: "blackCircle"), for: .normal)
            return cell

        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }

}
