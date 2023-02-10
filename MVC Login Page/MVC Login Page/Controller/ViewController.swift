//
//  ViewController.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 08/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var form: LoginForm = {
       let form = LoginForm()
        form.translatesAutoresizingMaskIntoConstraints = false
        form.eyeButtonAction = {self.eyeButtonTapped()}
        form.loginButtonAction = {self.loginButtonTapped()}
        form.tryAgainAction = {self.tryAgainTapped()}
        form.textFieldDelegate = self
        return form
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addSubview(form)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            form.topAnchor.constraint(equalTo: view.topAnchor),
            form.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            form.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            form.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: business logic (validation)
    
    func validateUserTextField() -> Bool {
        if (form.userTextField.text ?? "").isBlank {
            form.userFieldWarning.text = "Please enter your Email Id"
            form.userFieldWarning.isHidden = false
            form.userTextField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            if (form.userTextField.text ?? "").isEmail {
                form.userFieldWarning.isHidden = true
                form.userTextField.layer.borderColor = UIColor.systemBlue.cgColor
            } else {
                form.userFieldWarning.text = "Invalid Email Id"
                form.userFieldWarning.isHidden = false
                form.userTextField.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
        return form.userFieldWarning.isHidden
    }
    
    func validatePasswordTextField() -> Bool {
        if form.passwordTextField.text?.count == 0 {
            form.passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
            form.passwordFieldWarning.text = "Please enter your password"
            form.passwordFieldWarning.isHidden = false
        } else {
            form.passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
            form.passwordFieldWarning.isHidden = true
        }
        return form.passwordFieldWarning.isHidden
    }
    
    func validateTextFields() -> Bool {
        let userTextFieldStatus = validateUserTextField()
        let passwordTextFieldStatus = validatePasswordTextField()
        return userTextFieldStatus && passwordTextFieldStatus
    }
    
    private func tryAgainTapped() {
        form.passwordFieldWarning.isHidden = true
        form.userFieldWarning.isHidden = true
    }
    
    private func loginButtonTapped() {
        let validationStatus = validateTextFields()
        if validationStatus {
            let status = loginVerifier(emailId: form.userTextField.text, password: form.passwordTextField.text)
            if status {
               print("Your login is success now we can move to home view")
            } else {
                guard let loginFailAlert = form.loginFailPopUp else {
                    return
                }
                present(loginFailAlert, animated: true)
               print("Your id or password mismatch with our records try again")
            }
        }
    }
    
    //MARK: Doubt (Purely view based logic)
    
    private func eyeButtonTapped() {
        form.passwordTextField.isSecureTextEntry = !form.passwordTextField.isSecureTextEntry
        var image = "eye"
        if form.passwordTextField.isSecureTextEntry {
            image = "eye.slash"
        }
        form.eyeButton.setBackgroundImage(UIImage(systemName: image), for: .normal)
    }

    //MARK: DB Call
    
    private func loginVerifier(emailId: String?, password: String?) -> Bool {
        guard let emailId = emailId, let password = password else {
            return false
        }
        let student = DatabaseHandler.dataBaseHandlerInstance.readDataOfEmailId(emailId.lowercased())
        if student?.password == password {
            return true
        } else {
            return false
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        if textField == form.userTextField {
            maxLength = 100
        }
        if textField == form.passwordTextField {
            maxLength = 50
        }
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        if newString.count >= maxLength {
            if textField == form.userTextField {
                form.userFieldWarning.text = "Email Id reached maximum range"
                form.userFieldWarning.isHidden = false
            }
            if textField == form.passwordTextField {
                form.passwordFieldWarning.text = "Password reached maximum range"
                form.passwordFieldWarning.isHidden = false
            }
        } else {
            if textField == form.userTextField {
                form.userTextField.layer.borderColor = UIColor.systemBlue.cgColor
                form.userFieldWarning.isHidden = true
            }
            
            if textField == form.passwordTextField {
                form.passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
                form.passwordFieldWarning.isHidden = true
            }
            
        }
        return newString.count <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == form.userTextField {
            form.passwordTextField.becomeFirstResponder()
        }
        if textField == form.passwordTextField {
            loginButtonTapped()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == form.userTextField {
           let _ = validateUserTextField()
        } else {
            let _ = validatePasswordTextField()
        }
    }
}
