//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Mario Rendon Zapata on 2018-09-25.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
/* This value is either passed by `MealTableViewController` in `prepare(for:sender:)
    or constructed as part of adding a new meal.
 */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        // Enable the save button only if the text field has a valid Meal name
        updateSaveButtonState()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // disable the save button while editing
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // the info dictionary may contain multiple representations of the image. Use the original
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // set photoImageView to dispay the selected image.
        photoImageView.image = selectedImage
        
        // dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Dismisses the modal scene and animates the transition back to the previous scene (Meal list)
        dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        // If the save button was press, get the meal data ready
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        // Set the meal to be passed to MealTableViewController after the unwind segue
        meal = Meal(name: name, photo: photo, rating: rating)
        
        
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // ensures that if the user clicks on the image while typing in the text field, the keyboard is dismissed properly
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets user pick media from the photo library
        let imagePickerController = UIImagePickerController()
        
        // only allow photos to be picked adnd not taken
        imagePickerController.sourceType = .photoLibrary
        
        // NOTE: next two lines make sure that the view controller is notified when the user selects an image
        // set the view controller as delegate of imagePickerController
        imagePickerController.delegate = self
        // The method asks ViewController to present the view controller defined by imagePickerController
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // Mark: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

