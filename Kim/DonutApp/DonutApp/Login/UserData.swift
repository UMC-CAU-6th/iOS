//
//  UserData.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//

import Foundation

struct UserData{
    var userId: String
    var userPw: String
    
    static func loadMember() -> UserData {
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        let userPw = UserDefaults.standard.string(forKey: "userPw") ?? ""
        return UserData(userId: userId, userPw: userPw)
    }
    public func setMember() {
        UserDefaults.standard.set(userId, forKey: "userId")
        UserDefaults.standard.set(userPw, forKey: "userPw")
    }
}
