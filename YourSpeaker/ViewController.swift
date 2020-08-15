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
    
    static let defaults = UserDefaults.standard

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var sayIt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sayIt.layer.cornerRadius = 10
        sayIt.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
        
//        if ViewController.defaults.float(forKey: "Rate") == 0.0 {
//            ViewController.defaults.set(0.5, forKey: "Rate")
//        }
//
//
//        if ViewController.defaults.float(forKey: "Pitch") == 0.0 {
//            ViewController.defaults.set(0.5, forKey: "Pitch")
//        }
//
//        if ViewController.defaults.float(forKey: "Volume") == 0.0 {
//            ViewController.defaults.set(1.0, forKey: "Volume")
//        }
        
        
        if ViewController.defaults.dictionary(forKey: "selectedLanguage") == nil {
            let languageCode = "en-US"
            let langDictionary = ["languageCode": languageCode]
            ViewController.defaults.set(langDictionary, forKey: "selectedLanguage")
        }
        
    }

    @IBAction func speakPressed(_ sender: UIButton) {
        
        let langDictionary = ViewController.defaults.dictionary(forKey: "selectedLanguage")
        let language = langDictionary!["languageCode"]
        
        
        if let message = textField.text {
            let utterance = AVSpeechUtterance(string: message)
            utterance.voice = AVSpeechSynthesisVoice(language: language as! String)
            
            utterance.rate = ViewController.defaults.float(forKey: "Rate")
            utterance.pitchMultiplier = ViewController.defaults.float(forKey: "Pitch")
            utterance.volume = ViewController.defaults.float(forKey: "Volume")

            
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
            
            
            
        }
        textField.text = ""
    }
    
}

