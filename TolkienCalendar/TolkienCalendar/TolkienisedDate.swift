//
//  TolkienisedDate.swift
//  TolkienCalendar
//
//  Created by Amelia on 10/12/2019.
//  Copyright © 2019 Amelia. All rights reserved.
//

import UIKit
import Foundation

class TolkienisedDate {
    func dateTransform(date: Date) -> String {
        var month: String
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MMMM"
        month = formatter1.string(from: date)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "d"
        let day = formatter2.string(from: date)
        
        if (month == "January") {
            if (day == "1"){
                return "Yestarë"
            }
            else {
                return "Narvinyë " + day
            }
        }
        else if (month == "February") {
            return "Nénimë " + day
        }
        else if (month == "March") {
            return "Súlimë " + day
        }
        else if (month == "April") {
            return "Víressë " + day
        }
        else if (month == "May") {
            return "Lótessë " + day
        }
        else if (month == "June") {
            if (day == "30"){
                return "Loëndë"
            }
            else {
                return "Nárië " + day
            }
        }
        else if (month == "July") {
            return "Cermië " + day
        }
        else if (month == "August") {
            return "Urimë " + day
        }
        else if (month == "September") {
            return "Yavannië " + day
        }
        else if (month == "October") {
            return "Narquelië " + day
        }
        else if (month == "Novermber") {
            return "Hísimë " + day
        }
        else {
            if (day == "30"){
                return "Mettarë"
            }
            else {
                return "Ringarë " + day
            }
        }
    }
}
