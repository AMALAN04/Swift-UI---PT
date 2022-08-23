//
//  LoginViewController.swift
//  UI Basics LoginPage
//
//  Created by amalan-pt5585 on 22/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    let userText: UITextField = UITextField()
    let passwordText: UITextField = UITextField()
    let logIn: UIButton = UIButton()
    let signUp: UIButton = UIButton()
    let loginStackView = UIStackView()
    let signUpLabel: UILabel = UILabel()
    let signUpStackView: UIStackView = UIStackView()
    let overAllView: UIStackView = UIStackView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()

       
    }
    

    
}

extension LoginViewController {
    func style() {
        view.backgroundColor = .systemIndigo
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        userText.translatesAutoresizingMaskIntoConstraints = false
        userText.textColor = .black
        userText.textAlignment = .center
        userText.placeholder = "User"
        userText.backgroundColor = .white
        userText.layer.cornerRadius = 25
        
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.textColor = .black
        passwordText.textAlignment = .center
        passwordText.placeholder = "Password"
        passwordText.backgroundColor = .white
        passwordText.layer.cornerRadius = 25
        passwordText.isSecureTextEntry = true
        
        logIn.backgroundColor = .systemBlue
        logIn.setTitle("Log in", for: .normal)
        logIn.setTitleColor(.white, for: .normal)
        logIn.layer.cornerRadius = 25
        
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.spacing = 4
        loginStackView.axis = .vertical
        
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.textColor = .white
        //signUpLabel.textAlignment = .center
        signUpLabel.text = "Don't have accound?"
        signUpLabel.font = .systemFont(ofSize: 20)
        
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.spacing = 1
        signUpStackView.axis = .horizontal
        signUpStackView.alignment = .trailing
        
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.backgroundColor = .clear
        signUp.setTitleColor(.systemOrange, for: .normal)
        signUp.setTitle("Sigh up", for: .normal)
        
        overAllView.translatesAutoresizingMaskIntoConstraints = false
        overAllView.spacing = 4
        overAllView.axis = .vertical
        overAllView.alignment = .center
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func layout() {
        view.addSubview(overAllView)
        
        loginStackView.addArrangedSubview(userText)
        loginStackView.addArrangedSubview(passwordText)
        loginStackView.addArrangedSubview(logIn)
        
        signUpStackView.addArrangedSubview(signUpLabel)
        signUpStackView.addArrangedSubview(signUp)
        
        overAllView.addArrangedSubview(loginStackView)
        overAllView.addArrangedSubview(signUpStackView)
        
        
        let constraints = [
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         
            loginStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: loginStackView.trailingAnchor, multiplier: 3),
            
            userText.heightAnchor.constraint(equalToConstant: 50),
            
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            
            logIn.heightAnchor.constraint(equalToConstant: 50),
            
            signUp.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
