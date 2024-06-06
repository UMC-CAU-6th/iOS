//
//  fontExtend.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import Foundation
import UIKit

extension UIFont {
    static func NanumGothic(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "NanumGothicOTF"
        
        var weightString: String
        switch weight {
        case .regular:
            weightString = "Bold"
        case .light:
            weightString = "Light"
        case .bold:
            weightString = "ExtraBold"
        default:
            weightString = ""
        }
        
        return UIFont(name: "\(familyName)\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}
