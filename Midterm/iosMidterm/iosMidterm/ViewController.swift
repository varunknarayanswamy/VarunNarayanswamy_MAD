//
//  ViewController.swift
//  iosMidterm
//
//  Created by Varun Narayanswamy on 10/15/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var TotalHours:Float = 0
    var TotalGallons:Float = 0
    var CurrentGallons:Float = 0
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var roundTripText: UITextField!
    @IBOutlet weak var monthlySwitch: UISwitch!
    @IBOutlet weak var TransportImage: UIImageView!
    @IBOutlet weak var transportSwitch: UISegmentedControl!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var currentGas: UILabel!
    @IBOutlet weak var TotalGas: UILabel!
    
    var userC = user()
    override func viewDidLoad() {
        roundTripText.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func calculation()
    {
        var avgSpeed:Float = 0
        var gallons:Float = 0
        if (roundTripText.text?.isEmpty == false)
        {
            let roundTrip = Float(roundTripText.text!)
            if (transportSwitch.selectedSegmentIndex == 0)
            {
                avgSpeed = 10
                TotalHours = roundTrip!/avgSpeed
                TotalGallons = 0
            }
            else if (transportSwitch.selectedSegmentIndex == 1)
            {
                avgSpeed = 20
                gallons = 24
                TotalHours = roundTrip!/avgSpeed
                TotalGallons = roundTrip!/gallons
            }
            else
            {
                avgSpeed = 12
                TotalHours = roundTrip!/avgSpeed + 1/6
                TotalGallons = 0
            }
            if (monthlySwitch.isOn)
            {
                TotalHours = 20*TotalHours
                TotalGallons = 20 * TotalGallons
            }
            else //This alert checks if they can make it that day not that month
            {
                if (TotalGallons>CurrentGallons)
                {
                    let Alert = UIAlertController(title: "You Need more Gas", message: "You won't make it! Hit a gas station before you get too far", preferredStyle: UIAlertController.Style.alert)
                    let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    Alert.addAction(OK)
                    present(Alert, animated: true, completion: nil)
                }
            }
            totalTime.text = "\(TotalHours) Hours"
            TotalGas.text = "\(TotalGallons) Gallons"
        }
    }
    
    @IBAction func sendBack(_ segue:UIStoryboardSegue){
        nameLabel.text = userC.name
        emailLabel.text = userC.email
    }

    @IBAction func segmentedControl(_ sender: Any) {
        calculation()
        if (transportSwitch.selectedSegmentIndex == 0)
        {
            TransportImage.image = UIImage.init(named: "bike_icon")
        }
        else if (transportSwitch.selectedSegmentIndex == 1)
        {
            TransportImage.image = UIImage.init(named: "car_icon")
        }
        else
        {
            TransportImage.image = UIImage.init(named: "bus_icon")
        }
    }
    @IBAction func Hours(_ sender: UISwitch) {
        calculation()
    }
    @IBAction func Commute(_ sender: UIButton) {
        calculation()
    }
    @IBAction func GasAmount(_ sender: UISlider) {
        let val = sender.value
        CurrentGallons = val
        currentGas.text = "\(val) gallons"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    

}

