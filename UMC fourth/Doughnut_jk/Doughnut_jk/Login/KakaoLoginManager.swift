//
//  KakaoLoginManager.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

final class KakaoLoginManager {
    // MARK: - KakaoLoginManagerFuntion
    
    /// 카카오톡 토큰 정보를 받아왔는가를 따진다.
    /// - Parameters:
    ///   - oauthToken: oauthToken을 받아오면 성공
    ///   - error: 토큰 못 받아올 경우 에러
    ///   - completion: 핸들러 처리
    private func handleLoginResponse(oauthToken: OAuthToken?, error: Error?, completion: @escaping (Result<OAuthToken, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let oauthToken = oauthToken {
            completion(.success(oauthToken))
        }
    }
    
    /// 카카오 로그인 시도
    /// - Parameter completion: handleLoginResponse를 통해 토큰 받아오기 시도
    public func login(completion: @escaping (Result<OAuthToken, Error>) -> Void ) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                self?.handleLoginResponse(oauthToken: oauthToken, error: error, completion: completion)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                self?.handleLoginResponse(oauthToken: oauthToken, error: error, completion: completion)
            }
        }
    }
}
