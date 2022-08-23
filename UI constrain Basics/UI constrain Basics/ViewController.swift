//
//  ViewController.swift
//  UI constrain Basics
//
//  Created by amalan-pt5585 on 22/08/22.
//

import UIKit

class ViewController: UIViewController {
    let backgroundImage = UIImageView()
    let searchButton = UIButton()
    let searchField = UITextField()
    let sunImg = UIImageView()
    let searchStackView = UIStackView()
    let rootView = UIStackView()
    let tempLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        constrain()
        
    }


}

extension ViewController {
    func style() {
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.spacing = 10
        rootView.axis = .vertical
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        searchStackView.axis = .horizontal
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
       // locationButton.imageView?.backgroundColor = .white
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.placeholder = "Search"
        searchField.font = .preferredFont(forTextStyle: .callout)
        searchField.backgroundColor = .white
        searchField.layer.cornerRadius = 20
        searchField.textAlignment = .center
        
        sunImg.translatesAutoresizingMaskIntoConstraints = false
        sunImg.image = UIImage(systemName: "sun.max.fill")
        sunImg.tintColor = .yellow
        
        tempLabel.textColor = .white
        tempLabel.font = UIFont(name: "Helvetica Neue", size: 40)
        tempLabel.text = "38°C"
        
        
        
    
    }
    
    func constrain() {
        view.addSubview(backgroundImage)
        view.addSubview(rootView)
        //view.addSubview(sunImg)
        rootView.addArrangedSubview(searchStackView)
        rootView.addArrangedSubview(sunImg)
        rootView.addArrangedSubview(tempLabel)
        rootView.alignment = .trailing
        
        searchStackView.addArrangedSubview(searchField)
        searchStackView.addArrangedSubview(searchButton)
       
        let constrains = [
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rootView.trailingAnchor, multiplier: 1),
            
            //searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.trailingAnchor, multiplier: 1),
            
            //locationButton.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            //locationButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            //searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //searchField.leadingAnchor.constraint(equalToSystemSpacingAfter: locationButton.trailingAnchor, multiplier: 1),
            searchField.heightAnchor.constraint(equalToConstant: 40),
            //searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
             sunImg.widthAnchor.constraint(equalToConstant: 120),
             sunImg.heightAnchor.constraint(equalToConstant: 120),
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
