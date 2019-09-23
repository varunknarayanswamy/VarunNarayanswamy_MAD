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
    @IBOutlet var TheView: UIView!
    @IBOutlet weak var capsSwitch: UISwitch!
    @IBOutlet weak var ColorSegment: UISegmentedControl!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var SlidinIntoDMS: UISlider!
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
    @IBAction func ColorFunction(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1)
        {
            FFLabel.textColor = UIColor.blue
            sender.tintColor = UIColor.blue
            imageControl.tintColor = UIColor.blue
            SizeOutlet.textColor = UIColor.blue
            CapsOutlet.textColor = UIColor.blue
            SlidinIntoDMS.tintColor = UIColor.blue
            TheView.backgroundColor = UIColor.white
            capsSwitch.onTintColor = UIColor.blue
        }
        else
        {
            FFLabel.textColor = UIColor.red
            sender.tintColor = UIColor.red
            imageControl.tintColor = UIColor.red
            SizeOutlet.textColor = UIColor.red
            CapsOutlet.textColor = UIColor.red
            SlidinIntoDMS.tintColor = UIColor.red
            TheView.backgroundColor = UIColor.black
            capsSwitch.onTintColor = UIColor.red
            
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

