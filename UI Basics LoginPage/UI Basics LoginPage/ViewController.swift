//
//  ViewController.swift
//  UI Basics LoginPage
//
//  Created by amalan-pt5585 on 22/08/22.
//

import UIKit

class ViewController: UIViewController {
    let launchScreenImage: UIImageView = UIImageView()
    let educateImage: UIImageView = UIImageView()
    let welcomeLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    let nextButton: UIButton = UIButton()
    let stackView: UIStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }


}

extension ViewController {
    func style() {
        launchScreenImage.translatesAutoresizingMaskIntoConstraints = false
        launchScreenImage.image = UIImage(named: "background.jpg")
        launchScreenImage.contentMode = .scaleAspectFill
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = .preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.font = .systemFont(ofSize: 40)
        welcomeLabel.text = "WELCOME"
        
        educateImage.translatesAutoresizingMaskIntoConstraints = false
        educateImage.image = UIImage(named: "educate.png")
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .preferredFont(forTextStyle: .largeTitle)
        descriptionLabel.font = .systemFont(ofSize: 20)
        descriptionLabel.text = "Connect Through Knowledge"
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 25
        nextButton.backgroundColor = .systemBlue
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        
        
        
        
    }
    
    @objc func nextPressed() {
        let view = LoginViewController()
        let navigationView = UINavigationController(rootViewController: view)
        //navigationView.pushViewController(self, animated: true)
        navigationView.modalPresentationStyle = .fullScreen
        present(navigationView, animated: true)
        
    }
    
    func layout() {
        view.addSubview(launchScreenImage)
        view.addSubview(stackView)

        stackView.addArrangedSubview(educateImage)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(nextButton)
        
        let constrains = [
            launchScreenImage.topAnchor.constraint(equalTo: view.topAnchor),
            launchScreenImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            launchScreenImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            launchScreenImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            educateImage.widthAnchor.constraint(equalToConstant: 160),
            educateImage.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            
//            nextButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 4)
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
