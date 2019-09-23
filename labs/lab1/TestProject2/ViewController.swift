//
//  ViewController.swift
//  TestProject2
//
//  Created by Varun Narayanswamy on 9/3/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//
//https://funnyjunk.com/funny_pictures/1044961/Cleverbot/
//https://www.pinterest.com/pin/474777985697341348/?lp=true
//https://knowyourmeme.com/memes/surprised-pikachu
//http://www.quickmeme.com/meme/3sroh3
//https://archive.nyafuu.org/vp/thread/13826863/
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

