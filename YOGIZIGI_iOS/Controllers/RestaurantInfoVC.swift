//
//  RestaurantInfoVC.swift
//  YOGIZIGI_iOS
//
//  Created by 정아현 on 2023/05/21.
//

import Foundation
import UIKit

import UIKit

class RestaurantViewController: UIViewController {
    let restaurantImageView = UIImageView()
    let restaurantNameLabel = UILabel()
    let restaurantDetailsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the UI
        setupImageView()
        setupNameLabel()
        setupDetailsLabel()
    }

    func setupImageView() {
        // Add the imageView to the view
        self.view.addSubview(restaurantImageView)
        
        // Enable auto layout
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure imageView
        restaurantImageView.contentMode = .scaleAspectFill
        // Load your image here
        restaurantImageView.image = UIImage(named: "restaurant")
        
        // Constraints
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            restaurantImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 2.0/5.0)
        ])
    }

    func setupNameLabel() {
        // Add the label to the view
        self.view.addSubview(restaurantNameLabel)
        
        // Enable auto layout
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure label
        restaurantNameLabel.textAlignment = .center
        // Set your restaurant name here
        restaurantNameLabel.text = "Restaurant Name"
        
        // Constraints
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 13),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupDetailsLabel() {
        // Add the label to the view
        self.view.addSubview(restaurantDetailsLabel)
        
        // Enable auto layout
        restaurantDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure label
        restaurantDetailsLabel.numberOfLines = 0 // Allow line breaks
        // Set your restaurant details here
        restaurantDetailsLabel.text = "Location: \nOperating Hours: \nPhone: "
        
        // Constraints
        NSLayoutConstraint.activate([
            restaurantDetailsLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 13),
            restaurantDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantDetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

