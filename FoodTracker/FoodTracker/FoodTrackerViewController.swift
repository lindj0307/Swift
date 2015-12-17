//
//  FoodTrackerViewController.swift
//  FoodTracker
//
//  Created by 林东杰 on 12/14/15.
//
//

import UIKit

class FoodTrackerViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    //MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    //MARK: - Life Cycle
    
    //MARK: - TableView Delegate
    
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectImage
        dismissViewControllerAnimated(true , completion: nil )
    }
    
    //MARK: - Custom Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text

    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    
    //func
    //MARK: - TableView Datasource
    
    //MARK: - Event Response
    
    //MARK: - Private Methods
    
    func checkValidMealName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard. 
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true , completion: nil)
        
    }

    @IBAction func setDefaultLabelText(sender: UIButton) {

    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true , completion: nil )
    }
    //MARK: - Getters/Setters
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self

      
        
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Do any additional setup after loading the view.
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
