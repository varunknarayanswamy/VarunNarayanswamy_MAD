//
//  AddBook.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/5/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class AddBook: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var DoneButton: UIBarButtonItem!
    @IBOutlet weak var BookName: UITextField!
    @IBOutlet weak var BookPages: UITextField!
    @IBOutlet weak var BookSwitch: UISwitch!
    override func viewDidLoad() {
        BookName.delegate = self
        BookPages.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
    }
    @IBAction func Done(_ sender: UIBarButtonItem) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        activateBook()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activateBook()
    }
    

    func activateBook(){
        if (BookName.text!.isEmpty == false && BookPages.text!.isEmpty == false)
        {
            DoneButton.isEnabled = true
        }
        else
        {
            DoneButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NewBook")
        {
            if (BookName.text!.isEmpty == false && BookPages.text!.isEmpty == false)
            {
                let timeremaining = ViewController.globalVar.currentGoal.Time_per_books
                let newBook = Books()
                newBook.timeRemaining = timeremaining - 1
                newBook.currentBook = BookSwitch.isOn
                newBook.name = BookName.text!
                newBook.pages = Int(BookPages.text!)
                if (newBook.currentBook == true)
                {
                    for i in ViewController.globalVar.AllBooks
                    {
                        i.currentBook = false

                    }
                }
                let goalpages = newBook.pages!/newBook.timeRemaining
                newBook.GoalPages = goalpages
                ViewController.globalVar.AllBooks.append(newBook)
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
