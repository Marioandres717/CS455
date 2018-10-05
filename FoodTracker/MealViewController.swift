//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Mario Rendon Zapata on 2018-09-25.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
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
    

}

