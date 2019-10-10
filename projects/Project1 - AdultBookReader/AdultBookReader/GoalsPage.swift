//
//  GoalsPage.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/6/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class GoalsPage: UIViewController, UITextFieldDelegate {

    var date = Date()
    
    @IBOutlet weak var BookNumber: UITextField!
    @IBOutlet weak var Length: UITextField!
    @IBOutlet weak var goalType: UISegmentedControl!
    @IBOutlet weak var Done: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        Length.delegate = self
        BookNumber.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initialize()
    {
        if (ViewController.globalVar.currentGoal.StartDate == nil)
        {
            ViewController.globalVar.currentGoal.StartDate = date
        }
        datePicker.date = ViewController.globalVar.currentGoal.StartDate!
        if (ViewController.globalVar.currentGoal.totalBooks >= ViewController.globalVar.AllBooks.count)
        {
            BookNumber.text = String(ViewController.globalVar.currentGoal.totalBooks)
        }
        else
        {
            BookNumber.text = String(ViewController.globalVar.AllBooks.count)
        }
        if (ViewController.globalVar.currentGoal.totalMonths != 0)
        {
            Length.text = String(ViewController.globalVar.currentGoal.totalMonths)
        }
    }
    
    func checkField()
    {
        if (Length.text!.isEmpty == true || BookNumber.text!.isEmpty == true)
        {
            Done.isEnabled = false
        }
        else
        {
            Done.isEnabled = true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        checkField()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkField()
    }
    
    func setBookLengths()
    {
        var TimePerType = 0
        if (ViewController.globalVar.currentGoal.goalType == "day")
        {
            TimePerType = Calendar.current.dateComponents([.day], from: ViewController.globalVar.currentGoal.StartDate!, to: ViewController.globalVar.currentGoal.finalDate!).day!
            //Source: https://stackoverflow.com/questions/40075850/swift-3-find-number-of-calendar-days-between-two-dates
        }
        else if (ViewController.globalVar.currentGoal.goalType == "week")
        {
            let TimePerDay = Calendar.current.dateComponents([.day], from: ViewController.globalVar.currentGoal.StartDate!, to: ViewController.globalVar.currentGoal.finalDate!).day!
             //Source: https://stackoverflow.com/questions/40075850/swift-3-find-number-of-calendar-days-between-two-dates
            TimePerType = TimePerDay/7
        }
        else
        {
            TimePerType = Calendar.current.dateComponents([.month], from: ViewController.globalVar.currentGoal.StartDate!, to: ViewController.globalVar.currentGoal.finalDate!).month!
             //Source: https://stackoverflow.com/questions/40075850/swift-3-find-number-of-calendar-days-between-two-dates
        }
        let TimePerBook = TimePerType/(ViewController.globalVar.currentGoal.totalBooks)
        print(TimePerBook)
        ViewController.globalVar.currentGoal.Time_per_books = TimePerBook
    }
    
    func setFinalDate()
    {
        var dateCompFinal = DateComponents()
        dateCompFinal.month = Int(Length.text!)
        print(dateCompFinal.month)
        let final = Calendar.current.date(byAdding: dateCompFinal, to:  ViewController.globalVar.currentGoal.StartDate!)
        //Source: http://swiftdeveloperblog.com/code-examples/add-days-months-or-years-to-current-date-in-swift/
        ViewController.globalVar.currentGoal.finalDate = final!
        print("end date \(ViewController.globalVar.currentGoal.finalDate)")
        print("end date \(ViewController.globalVar.currentGoal.StartDate)")
    }
    
    func setNextDate()
    {
        var datecomp = DateComponents()
        if (goalType.selectedSegmentIndex == 0)
        {
            datecomp.day = 1
            ViewController.globalVar.currentGoal.goalType = "day"
            
        }
        else if (goalType.selectedSegmentIndex == 1)
        {
            datecomp.day = 7
            ViewController.globalVar.currentGoal.goalType = "week"
        }
        else
        {
            datecomp.month = 1
            ViewController.globalVar.currentGoal.goalType = "month"
        }
        let future = Calendar.current.date(byAdding: datecomp, to: ViewController.globalVar.currentGoal.StartDate!)
        //Source: http://swiftdeveloperblog.com/code-examples/add-days-months-or-years-to-current-date-in-swift/
        ViewController.globalVar.currentGoal.nextDate = future!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GoalsBack")
        {
            if (Length.text!.isEmpty == false && BookNumber.text!.isEmpty == false)
            {
                ViewController.globalVar.currentGoal.StartDate = datePicker.date
                ViewController.globalVar.currentGoal.totalMonths = Int(Length.text!)!
                ViewController.globalVar.currentGoal.totalBooks = Int(BookNumber.text!)!
                if (ViewController.globalVar.currentGoal.nextDate == nil)
                {
                    setNextDate()
                    setFinalDate()
                    setBookLengths()
                }
            }
        }
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
