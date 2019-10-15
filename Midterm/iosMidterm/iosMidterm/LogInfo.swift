//
//  LogInfo.swift
//  iosMidterm
//
//  Created by Varun Narayanswamy on 10/15/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class LogInfo: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    override func viewDidLoad() {
        NameField.delegate = self
        EmailField.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Return")
        {
            let ViewContr = segue.destination as! ViewController
            if (NameField.text?.isEmpty == false)
            {
                ViewContr.userC.name = NameField.text
            }
            if  (EmailField.text?.isEmpty == false)
            {
                ViewContr.userC.email = EmailField.text
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
