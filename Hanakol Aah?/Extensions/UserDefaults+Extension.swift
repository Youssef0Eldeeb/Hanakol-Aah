//
//  UserDefaults+Extension.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 25/04/2023.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultsKeys: String{
        case hasOnboard
    }
    var hasOnboarded: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasOnboard.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboard.rawValue)
        }
    }
}
