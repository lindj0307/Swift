//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by 林东杰 on 12/17/15.
//
//

import UIKit

class MealTableViewController: UITableViewController {

    
    // MARK: - Variable
    
    // MARK: - Properties
    var meals = [Meal]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        if let saveMeals = loadMeals() {
            meals += saveMeals
        } else {
            loadSampleMeals()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let meal1 = Meal(name: "Meal 1", photo: photo1, rating: 3)!
        let photo2 = UIImage(named: "meal2")
        let meal2 = Meal(name: "Meal 2", photo: photo2, rating: 5)!
        let photo3 = UIImage(named: "meal3")
        let meal3 = Meal(name: "Meal 3", photo: photo3, rating: 4)!
        let photo4 = UIImage(named: "meal4")
        let meal4 = Meal(name: "Meal 4", photo: photo4, rating: 1)!
        
        meals += [meal1,meal2,meal3,meal4]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "mealTableViewCell"
//        tableView.registerClass(MealTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            meals.removeAtIndex(indexPath.row)
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    // MARK: - Custom Delegate
    
    // MARK: - TableView Datasource
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? FoodTrackerViewController, meal = sourceViewController.meal {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            
            saveMeals()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetail" {
            let mealDetailViewController = segue.destinationViewController as! FoodTrackerViewController
            
            if let selectMealCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPathForCell(selectMealCell)!
                let selectMeal = meals[indexPath.row]
                mealDetailViewController.meal = selectMeal
            }
        } else if segue.identifier == "AddItem" {
            print("Adding new meal. ")
        }
    }
    
    // MARK: - Getters/Setters

    // MARK: - NSCoding
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchivURUL.path!)
        if !isSuccessfulSave {
            print("failed to save meals...")
        }
    }
    
    func loadMeals() ->[Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchivURUL.path!) as? [Meal]
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

}
