//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by 林东杰 on 12/30/15.
//  Copyright © 2015 Joey. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    
    // MARK: - Variable
    var player: Player?
    var game: String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*  界面初始化时触发  */
    required init?(coder aDecode:NSCoder) {
        print("init PlayseDetailsController")
        super.init(coder:aDecode)
    }
    
    /*  界面关闭时触发  */
    deinit {
        print("deinit PlayDetailsController")
    }
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - TableView Datasource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    // MARK: - Event Response
    
    // MARK: - Private Methods
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    @IBAction func unwindWithGameSelected(segue:UIStoryboardSegue) {
        if let gamepickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamepickerViewController.selectedGame {
                game = selectedGame
        }
    }
    
}


    // MARK: - Getters/Setters
    
    



    // MARK: - Table view data source
     /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */




