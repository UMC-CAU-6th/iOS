//
//  fontCheck.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import Foundation
import UIKit

class SettingCheck {
    
    public func checkFont() {
        // 폰트 체크 하기
        UIFont.familyNames.sorted().forEach{ familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
    }
}
