//
//  DatabaseHandler.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 09/02/23.
//

import Foundation

import UIKit
import SQLite3

class DatabaseHandler {
    
    static var dataBaseHandlerInstance = DatabaseHandler()
    var db : OpaquePointer?
    private var studentData: StudentData
    
    private init() {
        studentData = StudentData()
    }
    
    func createTables() {
        studentData.createStudentTable()
    }
    
    func loadData() {
        loadStudentData()
    }
    
    private func loadStudentData() {
        let rajesh = Student(name: "Rajesh", dob: "20-Jan-2001", phoneNo: "9445567156", emailId: "rj@gmail.com", userId: "rj", password: "1124")
        let ravi = Student(name: "Ravi", dob: "20-Jan-2001", phoneNo: "9445567156", emailId: "ravi@gmail.com", userId: "ravi", password: "1124")
        let demo = Student(name: "Demo", dob: "20-Jan-2001", phoneNo: "9445567156", emailId: "demo@gmail.com", userId: "demo", password: "1124")
        print("rajesh loaded: \(studentData.insertDataOf(student: rajesh))")
        print("rajesh loaded: \(studentData.insertDataOf(student: ravi))")
        print("demo loaded: \(studentData.insertDataOf(student: demo))")
    }
    
    func readDataOfEmailId(_ eMailId: String) -> LoginInfo? {
        return studentData.readDataOfEmailId(eMailId)
    }
    
}


