//
//  MeetingDescriptionVC.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 23/03/22.
//

import UIKit

class MeetingDescriptionVC: UIViewController {
    
//MARK: Variables
    var meetingReasonArr = ["Get To Know", "Collaborate","Ninja Talks","Advice Seeking","Mentor Talk","Paid Consulting"]
    var meetingTypeArr = ["In-Person", "Video-Call","Phone-Call"]
    var meetingHousekeepingArr = ["Coffee on me", "Grap you lunch","Meet on the go","I am Vaccinated"]
    var meetingDurationArr = ["30 min.","1 hour.","long meet."]
    
    var sectionArr = ["Meeting Reasons", "Meeting Type","Housekeeping","Meeting duration"]
    var arrCombined: NSMutableArray!
    var finalSelectedData = [String]()

//MARK: IBOutlets
    
@IBOutlet weak var collectionView: UICollectionView!
    
    
//MARK: View LIfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = true
        setDelegateAndDataSource()
        combinedArray()
    }
   
//MARK: Functions
    func setDelegateAndDataSource(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func combinedArray(){
        arrCombined = NSMutableArray(array: [meetingReasonArr, meetingTypeArr, meetingHousekeepingArr, meetingDurationArr])
    }

}

//MARK: Extension For CollectionView
extension MeetingDescriptionVC: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate  {
 //MARK: Return HeaderView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusable: UICollectionReusableView? = nil
        if(kind == UICollectionView.elementKindSectionHeader){
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reusable", for: indexPath) as! SectionHeaderView
        view.headerLabel.text = sectionArr[indexPath.section]
            reusable = view
    }
        return reusable!
    }
    
//MARK: Return Number of Sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionArr.count
    }
    
//MARK: Return Number of Items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (arrCombined.object(at: section) as! NSArray).count
        //return meetingReasonArr.count
    }
    
//MARK: Return Item or Section Index by
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingDescCollectionViewCell", for: indexPath) as! MeetingDescCollectionViewCell
        if(indexPath.section == 0){
            cell.backgroundColor = .systemGray2
            cell.layer.cornerRadius = 18.0
            cell.meetingReasonLabel.text = meetingReasonArr[indexPath.item]
            cell.meetingReasonLabel.textAlignment = .left
            
        }
        else if(indexPath.section == 1){
                cell.backgroundColor = .systemGray2
                cell.layer.cornerRadius = 18.0
                cell.meetingReasonLabel.text = meetingTypeArr[indexPath.item]
            cell.meetingReasonLabel.textAlignment = .left
            
        }
         else if(indexPath.section == 2){
                cell.backgroundColor = .systemGray2
                cell.layer.cornerRadius = 18.0
                cell.meetingReasonLabel.text = meetingHousekeepingArr[indexPath.item]
            cell.meetingReasonLabel.textAlignment = .left
            
        }
        else{
               cell.backgroundColor = .systemGray2
               cell.layer.cornerRadius = 18.0
               cell.meetingReasonLabel.text = meetingDurationArr[indexPath.item]
           cell.meetingReasonLabel.textAlignment = .left
       }
        return cell
        
    }
    
//MARK: Return Number Of Cell In Row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2  //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size - 142)
    }
    
//MARK: Return height of HeaderView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.0)
    }
//MARK: FOr Multiple selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
                if cell?.isSelected == true {
                    cell?.backgroundColor = UIColor.purple
                    //finalSelectedData.append(arrCombined[indexPath.row] as! String)
                }
        //finalSelectedData.append(arrCombined[indexPath.row] as! String)
        //print(finalSelectedData)
    }
    
//MARK: For DeSelect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
               cell?.backgroundColor = UIColor.systemGray2
            }
    }

