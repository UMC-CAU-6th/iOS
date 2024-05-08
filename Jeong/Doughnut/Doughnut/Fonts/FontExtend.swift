//
//  FontExtend.swift
//  Doughnut
//
//  Created by 정의찬 on 4/10/24.
//

import Foundation
import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        default:
            weightString = "Regular"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}
