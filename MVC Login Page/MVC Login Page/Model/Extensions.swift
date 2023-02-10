//
//  Extensions.swift
//  MVC Login Page
//
//  Created by amalan-pt5585 on 09/02/23.
//

import Foundation
import UIKit

extension String {
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil && count < 105
        } catch {
            return false
        }
    }
    
    var isPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil && count < 35
        } catch {
            return false
        }
    }
    
    var isName: Bool {
        return !isEmpty && range(of: "[^a-zA-Z\\s]", options: .regularExpression) == nil && count < 75
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && (res.range.length >= 8 && res.range.length <= 15)
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}
