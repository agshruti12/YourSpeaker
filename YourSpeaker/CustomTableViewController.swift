//
//  CustomTableViewController.swift
//  YourSpeaker
//
//  Created by Sumit K Agarwal on 8/13/20.
//  Copyright © 2020 Shruti Agarwal. All rights reserved.
//

import UIKit
import AVFoundation

class CustomTableViewController: UITableViewController {

    var messageArray = [String]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = ViewController.defaults.array(forKey: "messageArray") as? [String] {
            messageArray = items
        }

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }


    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = messageArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let langDictionary = ViewController.defaults.dictionary(forKey: "selectedLanguage")
        let language = langDictionary!["languageCode"]
        
        let message = messageArray[indexPath.row]
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: language as! String)
        
        utterance.rate = ViewController.defaults.float(forKey: "Rate")
        utterance.pitchMultiplier = ViewController.defaults.float(forKey: "Pitch")
        utterance.volume = ViewController.defaults.float(forKey: "Volume")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.messageArray.remove(at: indexPath.row)
            ViewController.defaults.set(self.messageArray, forKey: "messageArray")

            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - IB Actions
    
    @IBAction func addCustom(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //uialert controller
        let alert = UIAlertController(title: "Add New Custom Message", message: "", preferredStyle: .alert)
        
        //add textfield
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new message"
            textField = alertTextField
        }
        
        //add action
        let action = UIAlertAction(title: "Add Customization", style: .default) { (action) in
            //what will happen when user clicks Add Custom button on our alert
            //append textfield into messageArray
            
            
            let newMessage = textField.text!
            self.messageArray.append(newMessage)
            
            ViewController.defaults.set(self.messageArray, forKey: "messageArray")


            self.tableView.reloadData()

            
        }
        
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
   
 

}
