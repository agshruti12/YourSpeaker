//
//  PreferencesViewController.swift
//  YourSpeaker
//
//  Created by Sumit K Agarwal on 8/14/20.
//  Copyright © 2020 Shruti Agarwal. All rights reserved.
//

import UIKit
import AVFoundation

class PreferencesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Slider Properties
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateSlider: UISlider!
    
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    
    //MARK: - Language Properties
    let languageArray = ["AU","GB", "IE", "US", "ZA" ]
    var selectedLanguage = "AU"
    @IBOutlet weak var languagePicker: UIPickerView!
    

    //MARK: - Load Up
    override func viewDidLoad() {
        super.viewDidLoad()

        languagePicker.dataSource = self
        languagePicker.delegate = self
        
        let rateVal = ViewController.defaults.float(forKey: "Rate")
        rateSlider.value = rateVal
        rateLabel.text = "Rate: \(rateVal)"
        
        let pitchVal = ViewController.defaults.float(forKey: "Pitch")
        pitchSlider.value = pitchVal
        pitchLabel.text = "Pitch: \(pitchVal)"
        
        let volumeVal = ViewController.defaults.float(forKey: "Volume")
        volumeSlider.value = volumeVal
        volumeLabel.text = "Volume: \(volumeVal)"
        
        
    }
    
    //MARK: - UIPickerView Methods
    
    //number of cols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numbers of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageArray.count
    }
    
    //name rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row < languageArray.count) {
            return "English(\(languageArray[row]))"
        } else {
            return nil
        }
    }
    
    //selecting row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //make it the selected language
        selectedLanguage = languageArray[row]
    }
    
    //MARK: - Slider Methods
    
    @IBAction func rateChanged(_ sender: UISlider) {
        let rateValue = rateSlider.value
        rateLabel.text = "Rate: \(rateValue)"
        
    }
    
    @IBAction func pitchChanged(_ sender: UISlider) {
        let pitchValue = pitchSlider.value
        pitchLabel.text = "Pitch: \(pitchValue)"
        
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        let volumeValue = volumeSlider.value
        volumeLabel.text = "Volume: \(volumeValue)"
        
    }
    
    
    
    
    
    //MARK: - Set Default
    
    @IBAction func defaultPressed(_ sender: UIButton) {
        //save to userdefaults
        let languageCode = "en-\(selectedLanguage)"
        let langDictionary = ["languageCode": languageCode]
        ViewController.defaults.set(langDictionary, forKey: "selectedLanguage")
        
        ViewController.defaults.set(rateSlider.value, forKey: "Rate")
        ViewController.defaults.set(pitchSlider.value, forKey: "Pitch")
        ViewController.defaults.set(volumeSlider.value, forKey: "Volume")

        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
   
    
}
