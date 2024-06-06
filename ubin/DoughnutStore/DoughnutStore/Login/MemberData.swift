//
//  MemberData.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import Foundation

struct MemberData {
    var userId: String
    var userPw: String
    
    static func loadMember() -> MemberData {
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        let userPw = UserDefaults.standard.string(forKey: "userPw") ?? ""
        return MemberData(userId: userId, userPw: userPw)
    }
    
    public func setMember() {
        UserDefaults.standard.set(userId, forKey: "userId")
        UserDefaults.standard.set(userPw, forKey: "userPw")
    }
}

