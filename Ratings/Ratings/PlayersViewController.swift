//
//  PlayersViewController.swift
//  Ratings
//
//  Created by 林东杰 on 12/29/15.
//  Copyright © 2015 Joey. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    // MARK: - Variable
    var players: [Player] = playersData
    
    // MARK: - Properties
    
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
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - TableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell
        let player = players[indexPath.row] as Player
        cell.player = player
        
        /*
        // 2
        let player = players[indexPath.row] as Player
        // 3
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = player.name
        }
        if let gameLabel = cell.viewWithTag(101) as? UILabel {
            gameLabel.text = player.game
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating(player.rating)
        }
        */
        return cell
    }
    
    // MARK: - Navigation
    @IBAction func cancelToPlayersViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
            if let player = playerDetailsViewController.player {
                players.append(player)
                
                let indexPath = NSIndexPath(forRow: players.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
        
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
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
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
//    func imageForRating(rating: Int) ->UIImage? {
//        let imageName = "\(rating)Stars"
//        return UIImage(named: imageName)
//    }
    
    // MARK: - Getters/Setters



}
