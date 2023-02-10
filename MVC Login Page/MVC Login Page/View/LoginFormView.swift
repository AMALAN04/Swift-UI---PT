//
//  LoginFormView.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 09/02/23.
//

import UIKit

class LoginForm: UIView, LoginFormProtocol {
    var eyeButtonAction: (() -> Void)?
    var loginButtonAction: (() -> Void)?
    var tryAgainAction: (() -> Void)?
    var loginFailPopUp: UIAlertController?
    
    var textFieldDelegate: UITextFieldDelegate? {
        didSet {
            print("delegate setted")
            userTextField.delegate = textFieldDelegate!
            passwordTextField.delegate = textFieldDelegate!
        }
    }
    
    lazy var educateLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "educateLoginPageLogo.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.backgroundColor = .systemBackground
        textField.textColor = .label
        textField.placeholder = "Email"
        textField.font = .systemFont(ofSize: 18)
        
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 25
        
        textField.keyboardType = .emailAddress
        textField.enablesReturnKeyAutomatically = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .next
        
        textField.isSecureTextEntry =  false
        textField.clearButtonMode = .whileEditing
        
        let paddingViewLeft : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftView = paddingViewLeft
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 18)
        textField.backgroundColor = .systemBackground
        textField.textColor = .label
        
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 25
        
        textField.enablesReturnKeyAutomatically = true
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        
        textField.isSecureTextEntry =  true
        
        let paddingViewLeft : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        let paddingViewRight : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: textField.frame.height))
        textField.leftView = paddingViewLeft
        textField.rightView = paddingViewRight
        textField.rightViewMode = UITextField.ViewMode.always
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .secondaryLabel
        button.addTarget( self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        button.isOpaque = false
        button.alpha = 0.5
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create an account", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        button.titleLabel?.attributedText = underlineAttributedString
        return button
    }()
    
    lazy var signUpLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .label
        textLabel.text = "Don't have account?"
        return textLabel
    }()
    
    lazy var passwordFieldWarning: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .red
        textLabel.font = .systemFont(ofSize: 12, weight: .regular)
        textLabel.textAlignment = .center
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.isHidden = true
        return textLabel
    }()
    
    lazy var userFieldWarning: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .red
        textLabel.font = .systemFont(ofSize: 12, weight: .regular)
        textLabel.textAlignment = .center
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.isHidden = true
        return textLabel
    }()
    
    lazy var signInStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing =  20
        return stackView
    }()
    
    lazy var signUpStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 3
        return stackView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        self.backgroundColor = .systemBackground
        loginFailPopUp = loadLoginFailPopUp()
        addViews()
        addConstraints()
    }
    
    func addViews() {
        addSubview(signInStack)
        addSubview(loginButton)
        addSubview(educateLogoView)
        addSubview(passwordFieldWarning)
        addSubview(userFieldWarning)
        addSubview(signUpStack)
        
        signInStack.addArrangedSubview(userTextField)
        signInStack.addArrangedSubview(passwordTextField)
        
        signUpStack.addArrangedSubview(signUpLabel)
        signUpStack.addArrangedSubview(signUpButton)
        
        signInStack.addSubview(eyeButton)
    }
    
    func addConstraints() {
        let constraints = [
            signInStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            eyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -5),
            
            loginButton.topAnchor.constraint(equalTo: signInStack.bottomAnchor, constant:  30),
            loginButton.leadingAnchor.constraint(equalTo: signInStack.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: signInStack.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            educateLogoView.bottomAnchor.constraint(equalTo: signInStack.topAnchor, constant: -15),
            educateLogoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            educateLogoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userFieldWarning.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 1),
            userFieldWarning.leadingAnchor.constraint(equalTo: signInStack.leadingAnchor),
            userFieldWarning.trailingAnchor.constraint(equalTo: signInStack.trailingAnchor),
            
            passwordFieldWarning.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 1),
            passwordFieldWarning.leadingAnchor.constraint(equalTo: signInStack.leadingAnchor),
            passwordFieldWarning.trailingAnchor.constraint(equalTo: signInStack.trailingAnchor),
            
            signUpStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            signInStack.widthAnchor.constraint(equalToConstant: 280),
            
           
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eyeButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor, constant: -30),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func loadLoginFailPopUp() -> UIAlertController {
        let alert = UIAlertController(title: "Login Failed", message: "Your Email Id or password is incorrect.\n Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { [weak self] action in
            self?.tryAgainTapped()
        }))
        return alert
    }
    
    func tryAgainTapped() {
        guard let tryAgainAction = tryAgainAction else {
            return
        }
        tryAgainAction()
    }
    
    @objc func eyeButtonTapped() {
        guard let eyeButtonAction = eyeButtonAction else {
            return
        }
        eyeButtonAction()
    }
    
    @objc func loginButtonTapped() {
        guard let loginButtonAction = loginButtonAction else {
            return
        }
        loginButtonAction()
    }
    
}
