//
//  RantingControl.swift
//  FoodTracker
//
//  Created by Mario Rendon on 2018-09-29.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit

class RantingControl: UIStackView {

    // Mark: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // Mark: Private Methods
    
    private func setupButtons() {
        // create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.rati), for: <#T##UIControl.Event#>)
        // Add button the stack view (RatingControl view)
        addArrangedSubview(button)
    }

    // Mark: Button Action
    func rantingButtonTapped(button: UIButton) {
        print("Button pressed 👍🏿")
    }
}
