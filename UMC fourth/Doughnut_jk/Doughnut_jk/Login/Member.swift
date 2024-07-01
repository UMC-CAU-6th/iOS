//
//  Member.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/7/24.
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
    
    
    //내가 입력한 아이디,비밀번호 key로 가져오기
    public func setMember() {
        UserDefaults.standard.set(userId, forKey: "userId")
        UserDefaults.standard.set(userPw, forKey: "userPw")
    }
}
