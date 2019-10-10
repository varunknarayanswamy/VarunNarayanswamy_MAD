//
//  ViewController.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/5/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let date = Date()
    @IBOutlet weak var bookTable: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var add: UIBarButtonItem!
    struct globalVar {
        static var AllBooks = [Books]()
        static var currentGoal = goals()
    }
    var BookClass = [Books]()
    override func viewDidLoad() {
        globalVar.currentGoal.currentDate = date //the reason currentdate exists is so I have a date I can manually iterate it up, so that I can force the program to think a day/week/month has passed. That way, I can simulate the long term goal functionality of the application. In the real application currentDate would not exist
        bookTable.delegate = self
        bookTable.dataSource = self
        Initialize()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func AddBack(_ segue:UIStoryboardSegue){
        Initialize()
        AddBooks()
        bookTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LogB")
        {
            print("extra")
            let source = segue.destination as! LogPages
            let sourceIndex = bookTable.indexPathForSelectedRow?.row
            source.Book_info = BookClass[sourceIndex!]
        }
    }

    @IBAction func switchBooks(_ sender: UISegmentedControl) {
        AddBooks()
        if (sender.selectedSegmentIndex == 0)
        {
            globalVar.currentGoal.currentDate = globalVar.currentGoal.nextDate
            CheckGoals()
        }
    }
    
    func Initialize()
    {
        if (globalVar.currentGoal.StartDate == nil)
        {
            add.isEnabled = false
        }
        else
        {
            add.isEnabled = true
        }
    }
    
    func CheckGoals()
    {
        if (globalVar.currentGoal.nextDate == globalVar.currentGoal.currentDate)
        {
            print("checkingGoals")
            let Alert = UIAlertController(title: "Today is the day", message: "Turn in those pages!", preferredStyle: UIAlertController.Style.alert)
            let cancel  = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
            Alert.addAction(cancel)
            let okay  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                for (index,book) in self.BookClass.enumerated()
                {
                    if (book.currentBook == true)
                    {
                        print(index)
                        let path = IndexPath(row: index, section: 0)
                        self.bookTable.selectRow(at: path, animated: true, scrollPosition: .middle)
                        self.performSegue(withIdentifier: "LogB", sender: self.BookClass[index])
                    }
                }
            })
            Alert.addAction(okay)
            self.present(Alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookClass.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookCell else {return UITableViewCell()}
        cell.BookName.text = BookClass[indexPath.row].name
        if (BookClass[indexPath.row].currentBook == true)
        {
            cell.BookCurrent.text = "currentBook"
        }
        else
        {
            cell.BookCurrent.text = ""
        }
        return cell
    }
    
    func AddBooks()
    {
        BookClass.removeAll()
        for i in globalVar.AllBooks
        {
            if (segmentControl.selectedSegmentIndex == 0)
            {
                if (i.completed == false)
                {
                    BookClass.append(i)
                }
            }
            else
            {
                if (i.completed == true)
                {
                    BookClass.append(i)
                }
            }
        }
        bookTable.reloadData()
    }
}
