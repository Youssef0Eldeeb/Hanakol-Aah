//
//  UIViewController+Extensions.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 30/03/2023.
//

import Foundation
import UIKit

extension UIViewController{
    static var identifire: String{
        return String(describing: self)
    }
    static func instantiateVC(name: StoryboardEnum) -> Self{
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifire) as! Self
        return controller
    }
    
    enum StoryboardEnum: String{
        case Onboarding
        case Registration
    }
}
