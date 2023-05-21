//
//  ViewController.swift
//  YoZo
//
//  Created by 정아현 on 2023/05/21.
//

import UIKit

class RestaurantInfoVC: UIViewController {
    let restaurantImageView = UIImageView()
    let restaurantNameLabel = UILabel()
    let restaurantDetailsLabel = UILabel()
    let detailsIconsStackView = UIStackView()
    let mainContainerView = UIView()
    let menuLabel = UILabel()
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the UI
        setupImageView()
        setupNameLabel()
        setupDetailsLabel()
        setupMainContainerView()
        setupMenuLabel()
        setupMenuCollectionView()
    }

    func setupImageView() {
        self.view.addSubview(restaurantImageView)
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageView.contentMode = .scaleAspectFill
        restaurantImageView.image = UIImage(named: "환이네갈비살")

        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            restaurantImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0/5.0)
        ])
    }

    func setupNameLabel() {
        self.view.addSubview(restaurantNameLabel)
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.textAlignment = .center

        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 13),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }


    func setupDetailsLabel() {
        // Add the stackView to the view
        self.view.addSubview(detailsIconsStackView)
        
        // Enable auto layout
        detailsIconsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure stackView
        detailsIconsStackView.axis = .vertical
        detailsIconsStackView.distribution = .fillEqually
        detailsIconsStackView.spacing = 10
        
        // Details and icons
        let details = ["Location", "Operating Hours", "Phone"]
        let icons = [UIImage(named: "locationIcon"), UIImage(named: "timeIcon"), UIImage(named: "phoneIcon")]

        for (index, detail) in details.enumerated() {
            let imageView = UIImageView(image: icons[index])
            let label = UILabel()
            label.text = detail
            let detailView = UIStackView(arrangedSubviews: [imageView, label])
            detailView.axis = .horizontal
            detailView.spacing = 10
            detailsIconsStackView.addArrangedSubview(detailView)
        }

        // Constraints
        NSLayoutConstraint.activate([
            detailsIconsStackView.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 13),
            detailsIconsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsIconsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupMainContainerView() {
        self.view.addSubview(mainContainerView)
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        mainContainerView.backgroundColor = UIColor(hex: "#F9D949")
        
        NSLayoutConstraint.activate([
            mainContainerView.topAnchor.constraint(equalTo: detailsIconsStackView.bottomAnchor, constant: 10),
            mainContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupMenuLabel() {
        mainContainerView.addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.textAlignment = .center
        menuLabel.text = "Menu"

        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: mainContainerView.topAnchor, constant: 10),
            menuLabel.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor)
        ])
    }
    
    func setupMenuCollectionView() {
        mainContainerView.addSubview(menuCollectionView)
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 10),
            menuCollectionView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor)
        ])
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            let g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            let b = CGFloat(hexNumber & 0x0000ff) / 255
            self.init(red: r, green: g, blue: b, alpha: 1.0)
        } else {
            self.init()
        }
    }
}

