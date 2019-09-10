//
//  ViewController.swift
//  TestProject2
//
//  Created by Varun Narayanswamy on 9/3/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Pictura: UIImageView!
    @IBOutlet weak var MainLabel: UILabel!
    var holder: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func ButtonPress(_ sender: UIButton) {
        if (sender.titleLabel?.text == "Song Lyrics")
        {
            Pictura.image = UIImage.init(named: "pokemontheme")
            holder = MainLabel.text!
            MainLabel.text = "Song Lyrics"
            sender.setTitle(holder, for: .normal)
        }
        else if (sender.titleLabel?.text == "Pokemon Roast")
        {
            Pictura.image = UIImage.init(named: "pokemonImage")
            holder = MainLabel.text!
            MainLabel.text = "Pokemon Roast"
            sender.setTitle(holder, for: .normal)
        }
        else
        {
            Pictura.image = UIImage.init(named: "hilariousgame")
            holder = MainLabel.text!
            MainLabel.text = "Indian Version"
            sender.setTitle(holder, for: .normal)
        }
    }
}

