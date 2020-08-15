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

