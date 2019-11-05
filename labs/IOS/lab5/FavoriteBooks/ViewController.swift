//
//  ViewController.swift
//  FavoriteBooks
//
//  Created by Varun Narayanswamy on 10/3/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Area: UILabel!
    
    var user = favorite()
    
    @IBAction func sendBack(_ segue:UIStoryboardSegue){
        Name.text = user.favPok
        Area.text = user.area
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

