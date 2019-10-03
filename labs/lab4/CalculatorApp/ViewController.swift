//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Varun Narayanswamy on 9/26/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var TotalHoursOfWork: UITextField!
    @IBOutlet weak var NumberOfDaysGiven: UITextField!
    @IBOutlet weak var stepperPerson: UIStepper!
    @IBOutlet weak var PeopleNum: UILabel!
    
    @IBOutlet weak var WorkPerPerson: UILabel!
    @IBOutlet weak var WorkPerDay: UILabel!
    var people = 1
    let TextFieldDelegate = UITextFieldDelegate.self
    override func viewDidLoad() {
        TotalHoursOfWork.delegate = self
        NumberOfDaysGiven.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func ChangeNumPeople(_ sender: UIStepper) {
        people = Int(sender.value)
        if (people>1)
        {
            PeopleNum.text = "\(people) People"
            TextfieldCheck()
        }
        else if (people==1)
        {
            PeopleNum.text = "\(people) Person"
            TextfieldCheck()
        }
        else
        {
            
            let Alert = UIAlertController(title: "Too Few People", message: "At least 1 person better do work", preferredStyle: UIAlertController.Style.alert)
            let cancel  = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
            Alert.addAction(cancel)
            let okay  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.stepperPerson.value = 1
                self.TextfieldCheck()
            })
            Alert.addAction(okay)
            present(Alert, animated: true, completion: nil)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        TextfieldCheck()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        TextfieldCheck()
    }
    
    func TextfieldCheck() -> Bool {
        if (NumberOfDaysGiven.text?.isEmpty == false && TotalHoursOfWork.text?.isEmpty == false)
        {
            let totalTimeGiven = Float(NumberOfDaysGiven.text!)
            let TotalHours = Float(TotalHoursOfWork.text!)
            let totalHoursPerPerson = TotalHours!/Float(people)
            let hoursPerDay = totalHoursPerPerson/totalTimeGiven!
            WorkPerPerson.text = String(totalHoursPerPerson)
            WorkPerDay.text = String(hoursPerDay)
            return true
        }
        else
        {
            return false
        }
    }
}

//Source: https://stackoverflow.com/questions/11664115/unable-to-simultaneously-satisfy-constraints-will-attempt-to-recover-by-breakin
extension NSLayoutConstraint {
    
    override open var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}

