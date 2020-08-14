//
//  ViewController.swift
//  YourSpeaker
//
//  Created by Sumit K Agarwal on 8/13/20.
//  Copyright © 2020 Shruti Agarwal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func speakPressed(_ sender: UIButton) {
        if let message = textField.text {
            let utterance = AVSpeechUtterance(string: message)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
            
        }
        textField.text = ""
    }
    
}

