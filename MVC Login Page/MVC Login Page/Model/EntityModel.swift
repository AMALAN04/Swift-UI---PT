//
//  EntityModel.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 09/02/23.
//

import Foundation

class User {
    var profile: String = "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    var name: String
    var dob: String = "-"
    var phoneNo: String = ""
    var emailId: String
    var skillSet: String = "-"
    var userId: String
    var password: String
    
    init(name: String, dob: String, phoneNo: String, emailId: String, userId: String, password: String) {
        self.name = name
        self.dob = dob
        self.phoneNo = phoneNo
        self.emailId = emailId
        self.userId = userId
        self.password = password
    }
    
   init(name: String, emailId: String, userId: String, password: String) {
        self.name = name
        self.emailId = emailId
        self.userId = userId
        self.password = password
    }
}

class Student: User {
    var gender: String = ""
}

struct LoginInfo {
    var userId: String
    var password: String
}
