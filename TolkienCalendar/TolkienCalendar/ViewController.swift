//
//  ViewController.swift
//  TolkienCalendar
//
//  Created by Amelia on 10/12/2019.
//  Copyright © 2019 Amelia. All rights reserved.
//

import UIKit
import EventKit
import KDCalendar


//TWEAK TO MAKE ALL DATES APPEAR AS "TOLKIENISED" -- IF HAVE EXTRA TIME, ADD TENGWAR BUTTON
class ViewController: UIViewController, CalendarViewDataSource, CalendarViewDelegate {
    
    @IBOutlet weak var calendarView: CalendarView!
    
    @IBOutlet weak var previousMonthButton: UIButton!
    
    @IBOutlet weak var nextMonthButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func setupCalendar() {
        let style = CalendarView.Style()

        style.cellShape                = .bevel(8.0)
        style.cellColorDefault         = UIColor.clear
        style.cellColorToday           = UIColor(red:1.00, green:0.84, blue:0.64, alpha:1.00)
        style.cellSelectedBorderColor  = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.headerTextColor          = UIColor.gray

        style.cellTextColorDefault     = UIColor(red: 249/255, green: 180/255, blue: 139/255, alpha: 1.0)
        style.cellTextColorToday       = UIColor.orange
        style.cellTextColorWeekend     = UIColor(red: 237/255, green: 103/255, blue: 73/255, alpha: 1.0)
        style.cellColorOutOfRange      = UIColor(red: 249/255, green: 226/255, blue: 212/255, alpha: 1.0)
        
        style.headerBackgroundColor    = UIColor.white
        style.weekdaysBackgroundColor  = UIColor.white
        style.firstWeekday             = .sunday

        style.locale                   = Locale(identifier: "en_US")

        style.timeZone                 = TimeZone(abbreviation: "UTC")!

        style.cellFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.weekdaysFont = UIFont(name: "Helvetica", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)

        calendarView.style = style

        calendarView.dataSource = self
        calendarView.delegate = self

        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true

        calendarView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0)
    }
        
    override func viewDidAppear(_ animated: Bool) {
            
        super.viewDidAppear(animated)
        setupCalendar()
        let today = Date()
            
        var tomorrowComponents = DateComponents()
        tomorrowComponents.day = 1
            
        let tomorrow = self.calendarView.calendar.date(byAdding: tomorrowComponents, to: today)!
        self.calendarView.selectDate(tomorrow)

        #if KDCALENDAR_EVENT_MANAGER_ENABLED
        self.calendarView.loadEvents() { error in
            if error != nil {
                let message = "The karmadust calender could not load system events. It is possibly a problem with permissions"
                let alert = UIAlertController(title: "Events Loading Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        #endif
            
            
        self.calendarView.setDisplayDate(today)
    }

    // MARK : KDCalendarDataSource
    
    func startDate() -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.month = 0
        
        let today = Date()
        
        let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return threeMonthsAgo
    }
    
    func endDate() -> Date {
        
        var dateComponents = DateComponents()
      
        dateComponents.month = 12
        let today = Date()
        
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        
        return twoYearsFromNow
  
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        self.calendarView.setDisplayDate(date)
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        self.calendarView.setDisplayDate(date)
    }
    
    // MARK : KDCalendarDelegate
   
    func calendar(_ calendar: CalendarView, didSelectDate date : Date, withEvents events: [CalendarEvent]) {
        
        print("Did Select: \(date) with \(events.count) events")
        for event in events {
            print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
        }
        
    }
    
    
    func calendar(_ calendar: CalendarView, didLongPressDate date : Date, withEvents events: [CalendarEvent]?) {
        let vc: DateViewController = DateViewController()
        let tolkienConverter: TolkienisedDate = TolkienisedDate()
        vc.dateLabel.text = tolkienConverter.dateTransform(date: date)
    }
    
    
    func headerString(_ date: Date) -> String? {
        let tolkienDate = TolkienisedDate()
        let returnStr = tolkienDate.dateTransform(date: date)
        print(returnStr)
        return returnStr
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        true
    }
    
    // MARK : Events
    
    @IBAction func goToPreviousMonth(_ sender: Any) {
        self.calendarView.goToPreviousMonth()
    }
    @IBAction func goToNextMonth(_ sender: Any) {
        self.calendarView.goToNextMonth()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}






