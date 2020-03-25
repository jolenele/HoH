//
//  Utilities.swift
//  HoH
//
//  Created by Macintosh HD on 2020-03-24.
//  Copyright © 2020 Jolene. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool {
        // Use Regex for password validation
        // 1. Password length is 8
        // 2. Contain one number
        // 3. Contain one special character
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func isValidEmail(_ email : String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailTest.evaluate(with: email)
    }
}
