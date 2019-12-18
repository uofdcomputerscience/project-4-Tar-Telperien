//
//  DateViewController.swift
//  TolkienCalendar
//
//  Created by Amelia on 15/12/2019.
//  Copyright © 2019 Amelia. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var todayIsLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var languageSwitchButton: UIButton!
    
    var quenya: Bool = false
    var date: String = "DATE"
    let todayIs: String = "Today Is: "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = date
        todayIsLabel.text = todayIs
        todayIsLabel.font = UIFont(name: "Papyrus", size: 35)
        dateLabel.font = UIFont(name: "Papyrus", size: 40)
        languageSwitchButton.titleLabel?.text = "Tengwar"
        languageSwitchButton.titleLabel?.font = UIFont(name: "TengwarEldamar", size: 35)
        languageSwitchButton.titleLabel?.text = "Quenya"
    }
    
    @IBAction func languageSwitchTapped(_ sender: UIButton) {
        if (quenya == false) {
            todayIsLabel.font = UIFont(name: "TengwarEldamar", size: 35)
            dateLabel.font = UIFont(name: "TengwarEldamar", size: 40)
            languageSwitchButton.titleLabel?.font = UIFont(name: "Papyrus", size: 35)
            languageSwitchButton.titleLabel?.text = "English"
            quenya = true
        } else {
            todayIsLabel.font = UIFont(name: "Papyrus", size: 35)
            dateLabel.font = UIFont(name: "Papyrus", size: 40)
            languageSwitchButton.titleLabel?.font = UIFont(name: "TengwarEldamar", size: 35)
            languageSwitchButton.titleLabel?.text = "Quenya"
            quenya = false
        }
        self.view.reloadInputViews()
    }
}
