//
//  Protocol.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 09/02/23.
//

import Foundation
import UIKit

protocol LoginFormProtocol: UIView {
    var eyeButtonAction: (() -> Void)? { get set }
    var loginButtonAction: (() -> Void)? { get set }
    var tryAgainAction: (() -> Void)? { get set }
    var loginFailPopUp: UIAlertController? { get set }
    var userTextField: UITextField { get set }
    var passwordTextField: UITextField { get set }
    var eyeButton: UIButton { get set }
    var loginButton: UIButton { get set }
    var signUpButton: UIButton { get set }
    var passwordFieldWarning: UILabel { get set }
    var userFieldWarning: UILabel { get set }
    var textFieldDelegate: UITextFieldDelegate? { get set }
}
