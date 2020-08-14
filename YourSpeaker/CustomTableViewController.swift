//
//  CustomTableViewController.swift
//  YourSpeaker
//
//  Created by Sumit K Agarwal on 8/13/20.
//  Copyright © 2020 Shruti Agarwal. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
 

   
 

}
