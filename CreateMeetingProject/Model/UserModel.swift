//
//  UserModel.swift
//  CreateMeetingProject
//
//  Created by Divya Pathak on 25/03/22.
//

import Foundation
import UIKit

struct UserModel{
    //var name: [Any]
    var name: String?
    var names: String?
    var nameWithDesc: String?
    var meetingReason: String?
    var userProfilePic: String?
    
    var meetingType: String?
    var houseKeeping: String?
    var date: String?
    var date2: String?
    var date3: String?
    var time: String?
    var time2: String?
    var time3: String?
    var profileDesc: String?
    
    
    var dictionary: [String: Any] {
        return ["name": name ?? "sadsfs" as Any,
                    "names": names ?? "fsdf" as Any,
                    "nameWithDesc": nameWithDesc ?? "dsfsdf" as Any,
                    "meetingReason": meetingReason ?? "ffg" as Any,
                    "userProfilePic": userProfilePic ?? "dsdfd" as Any,
                    "meetingType": meetingType ?? "dfdsgs" as Any,
                    "houseKeeping": houseKeeping ?? "sdgdfgd" as Any,
                    "date" : date ?? "vvs" as Any,
                    "date2": date2 ?? "ddsf" as Any,
                    "date3": date3 ?? "vvshh" as Any,
                    "time": time ?? "vvdds" as Any,
                    "time2": time2 ?? "vaEWvs" as Any,
                    "time3": time3 ?? "vvWDs" as Any,
                    "profileDesc": profileDesc ?? "vvFGDGs" as Any
                    
                    
                    
            ]
        }
}

