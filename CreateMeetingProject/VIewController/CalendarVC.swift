//
//  CalendarVC.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 24/03/22.
//

import UIKit

class CalendarVC: UIViewController {
    
//MARK: Variables
    var daysArr = ["M", "T","W","T","F","S","S","M", "T","W","T","F","S","S"]
    var hoursArr = ["8", "9","10","11","12","13","14","15","16","17","18","19","20","21"]
    var minutesArr = ["00","15","30","45"]
    
    var sectionArr = ["Day", "Hour","Minutes"]
    var arrCombined: NSMutableArray!
    var finalSelectedDatas = [String]()
    
//MARK: IBOutlets

@IBOutlet weak var collectionView: UICollectionView!
    
//MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSource()
        combinedArray()
        collectionView.allowsMultipleSelection = true
    }
    

//MARK: Functions
    func setDelegateAndDataSource(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func combinedArray(){
        arrCombined = NSMutableArray(array: [daysArr, hoursArr, minutesArr])
    }
}


//MARK: Extension For CollectionView
extension CalendarVC: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate  {
 //MARK: Return HeaderView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusable: UICollectionReusableView? = nil
        if(kind == UICollectionView.elementKindSectionHeader){
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CalendarHeaderView", for: indexPath) as! CalendarHeaderView
        view.calendarHeaderLabel.text = sectionArr[indexPath.section]
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        if(indexPath.section == 0){
            cell.backgroundColor = .systemGray2
            cell.layer.cornerRadius = 20.0
            cell.dayLabel.text = daysArr[indexPath.item]
            cell.dayLabel.textAlignment = .center
            
        }
        else if(indexPath.section == 1){
                cell.backgroundColor = .systemGray2
                cell.layer.cornerRadius = 20.0
                cell.dayLabel.text = hoursArr[indexPath.item]
                cell.dayLabel.textAlignment = .center
            
        }
         else{
                cell.backgroundColor = .systemGray2
                cell.layer.cornerRadius = 20.0
                cell.dayLabel.text = minutesArr[indexPath.item]
                cell.dayLabel.textAlignment = .center
            
        }
        return cell
        
    }
    
//MARK: Return Number Of Cell In Row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 7  //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
        
        
    }
    
//MARK: Return height of HeaderView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.indexPathsForSelectedItems?.filter({ $0.section == indexPath.section }).forEach({ collectionView.deselectItem(at: $0, animated: false) })
        return true
    }
    
    
    }

