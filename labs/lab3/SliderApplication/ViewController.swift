//
//  ViewController.swift
//  SliderApplication
//
//  Created by Varun Narayanswamy on 9/12/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SizeOutlet: UILabel!
    @IBOutlet weak var CapsOutlet: UILabel!
    @IBOutlet weak var FamFriendImage: UIImageView!
    @IBOutlet weak var FFLabel: UILabel!
    @IBOutlet weak var capsSwitch: UISwitch!
    @IBOutlet weak var imageControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SlippingAndSlidin(_ sender: UISlider) {
        let fontSize = sender.value
        SizeOutlet.text = String(format: "%.0f", fontSize)
        FFLabel.font = UIFont(name: FFLabel.font.fontName, size: CGFloat(fontSize))
    }
    @IBAction func CapsAndSlaps(_ sender: UISwitch) {
        if sender.isOn{
       CapsOutlet.text = CapsOutlet.text?.uppercased()
        FFLabel.text = FFLabel.text?.uppercased()
        }
        else
        {
            CapsOutlet.text = CapsOutlet.text?.lowercased()
            FFLabel.text = FFLabel.text?.lowercased()
        }
    }
    @IBAction func selectFF(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 1)
        {
            FamFriendImage.image = UIImage.init(named: "idiots")
            FFLabel.text = "Fam Idiots"
            CapsAndSlaps(capsSwitch)
        }
        else
        {
            FamFriendImage.image = UIImage.init(named: "hugeidiots")
            FFLabel.text = "Huge Nerds"
            CapsAndSlaps(capsSwitch)
        }
        
    }
    

}

