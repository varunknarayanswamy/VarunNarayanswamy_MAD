//
//  PokemonCatch.swift
//  FavoriteBooks
//
//  Created by Varun Narayanswamy on 10/3/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class PokemonCatch: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var AreaTextField: UITextField!
    override func viewDidLoad() {
        NameTextField.delegate = self
        AreaTextField.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ID2"
        {
            let scene1ViewController = segue.destination as! ViewController
            if (NameTextField.text!.isEmpty == false)
            {
                scene1ViewController.user.favPok = NameTextField.text
            }
            if (AreaTextField.text!.isEmpty == false)
            {
                scene1ViewController.user.area = AreaTextField.text
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
