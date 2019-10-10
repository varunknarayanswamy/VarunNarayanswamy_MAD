//
//  LogPages.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/6/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class LogPages: UIViewController, UITextFieldDelegate {

    var Book_info = Books()
    var date = Date()
    var PRead = 0
    var PRemaining = 0
    var PTotal = 0
    @IBOutlet weak var Submit: UIBarButtonItem!
    @IBOutlet weak var BookName: UILabel!
    @IBOutlet weak var PagesRead: UILabel!
    @IBOutlet weak var GoalPages: UILabel!
    @IBOutlet weak var RemainingPages: UILabel!
    @IBOutlet weak var PageLogTextField: UITextField!
    override func viewDidLoad() {
        PageLogTextField.delegate = self
        initialize()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func checkField()
    {
        if (PageLogTextField.text!.isEmpty == true)
        {
            Submit.isEnabled = false
        }
        else
        {
            Submit.isEnabled = true
        }
    }
    
    func initialize()
    {
        BookName.text = Book_info.name!
        PRead = Book_info.currentPages
        PagesRead.text = String(Book_info.currentPages)
        PTotal = Book_info.pages!
        PRemaining = PTotal - PRead
        RemainingPages.text = String(PRemaining)
        if (Book_info.currentBook == true)
        {
            GoalPages.text = String(Book_info.GoalPages)
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
    
    func UpdateBook(_ index: Int)
    {
        if (ViewController.globalVar.currentGoal.nextDate == ViewController.globalVar.currentGoal.StartDate && ViewController.globalVar.AllBooks[index].currentBook == true)
        {
            ViewController.globalVar.AllBooks[index].weeklyPages = ViewController.globalVar.AllBooks[index].weeklyPages + Int(PagesRead.text!)!
            ViewController.globalVar.AllBooks[index].timeRemaining = ViewController.globalVar.AllBooks[index].timeRemaining - 1
            let Remaining_pages = ViewController.globalVar.AllBooks[index].pages! - ViewController.globalVar.AllBooks[index].currentPages
            ViewController.globalVar.AllBooks[index].GoalPages = Remaining_pages/ViewController.globalVar.AllBooks[index].timeRemaining
            setNextDate()
        }
    }
    
    func setNextDate()
    {
        var datecomp = DateComponents()
        if (ViewController.globalVar.currentGoal.goalType == "day")
        {
            datecomp.day = 1
            
        }
        else if (ViewController.globalVar.currentGoal.goalType == "week")
        {
            datecomp.day = 7
        }
        else
        {
            datecomp.month = 1
        }
        let future = Calendar.current.date(byAdding: datecomp, to: ViewController.globalVar.currentGoal.StartDate!)
        ViewController.globalVar.currentGoal.nextDate = future!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PagesLogged")
        {
            if (PageLogTextField.text!.isEmpty == false)
            {
                let NewLog = Int(PageLogTextField.text!)
                for (index,i) in ViewController.globalVar.AllBooks.enumerated()
                {
                    if (i.name == Book_info.name)
                    {
                        i.currentPages = NewLog! + i.currentPages
                        UpdateBook(index)
                        if (i.currentPages == i.pages!)
                        {
                            i.completed = true
                            i.currentBook = false
                            for j in ViewController.globalVar.AllBooks
                            {
                                if (j.completed == false)
                                {
                                    j.currentBook = true
                                    break
                                }
                            }
                        }
                    }
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
