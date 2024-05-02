//
//  KakaoLogin.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth

final class KakaoLogin {
    // MARK: - Kakao Login Manage
    
    ///카카오톡 토큰 정보를 받아왔는지
    private func handleLoginResponse(oauthToken: OAuthToken?, error: Error?, completion: @escaping (Result<OAuthToken, Error>) -> Void){
        if let error = error {
            completion(.failure(error))
        } else if let oauthToken = oauthToken {
            completion(.success(oauthToken))
        }
    }
    
    ///카카오톡 로그인 시도
    public func login(completion: @escaping (Result<OAuthToken, Error>) -> Void){
        if UserApi.isKakaoTalkLoginAvailable(){
            UserApi.shared.loginWithKakaoTalk{[weak self](oauthToken, error) in
                self?.handleLoginResponse(oauthToken: oauthToken, error: error, completion: completion)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount{[weak self](oauthToken, error) in
                self?.handleLoginResponse(oauthToken: oauthToken, error: error, completion: completion)
            }
        }
    }
}
