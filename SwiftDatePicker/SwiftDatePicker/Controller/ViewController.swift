//
//  ViewController.swift
//  SwiftDatePicker
//
//  Created by iMac on 20/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var selectedDate = Date()
    var selectedDay = "today"
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Selectors
    
    // Date Picker Button Action
    @IBAction func datePickerButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        self.addDatePickerView()
    }
    
    // MARK: - Helper Functions
    
    // Add Date Picker
    func addDatePickerView() {
        let datePickerView = DatePickerView.init(frame: self.view.bounds)
        datePickerView.tag = 1001
        datePickerView.delegate = self
        datePickerView.datePicker.date = Date()
        datePickerView.datePicker.minimumDate = Date()
        self.view.addSubview(datePickerView)
        self.view.bringSubviewToFront(datePickerView)
    }
    
    // removeSubView
    func removeSubView() {
        for subview in (self.view.subviews) {
            if subview.tag == 1001 {
                subview.removeFromSuperview()
            }
        }
    }
    
}

// MARK: - Extensions

// MARK: DatePickerViewDelegate Methods
extension ViewController: DatePickerViewDelegate {
    
    func datePickerOkButtonAction(view: DatePickerView, sender: UIButton, date: Date) {
        let today = Date()
        self.selectedDate = date
        
        print(self.selectedDate)
        
        let todayIsSelected = Calendar.current.isDate(today, inSameDayAs: self.selectedDate)
        let yesterDayIsSelected = Calendar.current.isDateInYesterday(self.selectedDate)
        let tomorrowIsSelected = Calendar.current.isDateInTomorrow(self.selectedDate)
        
        if todayIsSelected {
            self.selectedDay = "today"
        } else if yesterDayIsSelected {
            self.selectedDay = "yesterday"
        } else if tomorrowIsSelected {
            self.selectedDay = "tomorrow"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd, MMM, yyyy"
            self.selectedDay = dateFormatter.string(from: self.selectedDate)
        }
        self.removeSubView()
    }
    
    func datePickerCancelButtonAction(view: DatePickerView, sender: UIButton) {
        self.removeSubView()
    }
    
}
