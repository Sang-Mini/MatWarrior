//
//  Place.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/03.
//

import Foundation
import UIKit

struct Place {
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    let date: String
    let deadlineApplications: String
    let image: UIImage?
    
    init(name: String, address: String, latitude: Double, longitude: Double, date: String, deadlineApplications: String, image: UIImage) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.deadlineApplications = deadlineApplications
        self.image = image
    }
    
    var dateObject: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd (E)"
        
        return formatter.date(from: date)
    }
}
