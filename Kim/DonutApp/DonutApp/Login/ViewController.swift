//
//  ViewController.swift
//  DonutApp
//
//  Created by 김나연 on 5/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var kakaoLogin = KakaoLogin()
    private let user1 = UserData(userId: "id1", userPw: "pw1")
    
    // MARK: - Title
    ///제목
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -1.0,
            .font: UIFont(name: "Inter-ExtraBold", size: 64) ?? UIFont.systemFont(ofSize: 64, weight: .bold)
        ]
        title.attributedText = NSAttributedString(string: "Donut App", attributes: strokeTextAttributes)
        return title
    }()
    
    ///도넛 이미지
    private lazy var titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "donut")
        imageView.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        return imageView
    }()
    
    // MARK: - Login
    ///로그인, 비밀번호 입력 창
    private lazy var loginTextField: UITextField = {
        var textField = UITextField()
        textField.frame.size.width = 338
        textField.frame.size.height = 45
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.font = UIFont(name: "Inter", size: 15)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        let placeholderPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = placeholderPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "아이디"
        textField.layer.cornerRadius = 20
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        return textField
    }()
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.frame.size.width = 338
        textField.frame.size.height = 45
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.font = UIFont(name: "Inter", size: 15)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.placeholder = "비밀번호"
        let placeholderPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = placeholderPaddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 20
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        return textField
    }()
    
    ///로그인 버튼
    private lazy var loginButton: UIButton = {
        var button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: "loginbuttonColor")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -5.0,
            .font: UIFont(name: "Inter-ExtraBold", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        button.setAttributedTitle(NSAttributedString(string: "Log in", attributes: strokeTextAttributes), for: .normal)
        //TODO: - Selector에 대한 공부가 필요할듯..
        button.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        return button
    }()
    
    ///or
    private lazy var orText: UILabel = {
        let ortxt = UILabel()
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -5.0,
            .font: UIFont(name: "Inter-ExtraBold", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        ortxt.attributedText = NSAttributedString(string: "Or", attributes: strokeTextAttributes)
        return ortxt
    }()
    
    // MARK: - Kakao login
    ///카카오톡 로그인 버튼
    private lazy var kakaoButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kakao")
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickedKakao))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        user1.setMember()
        
        ///add views
        view.addSubview(titleLabel)
        view.addSubview(titleImage)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(orText)
        view.addSubview(kakaoButton)
        
        ///snapkit
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(27)
            make.centerX.equalToSuperview()
        }
        titleImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        loginTextField.snp.makeConstraints{ make in
            make.top.equalTo(titleImage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(338)
            make.height.equalTo(45)
        }
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(loginTextField.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
            make.width.equalTo(338)
            make.height.equalTo(45)
        }
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.centerX.equalToSuperview()
            make.width.equalTo(178)
            make.height.equalTo(45)
        }
        orText.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(13)
            make.centerX.equalToSuperview()
        }
        kakaoButton.snp.makeConstraints{ make in
            make.top.equalTo(orText.snp.bottom).offset(13)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Button Action
    ///로그인 버튼
    @objc private func clickedLogin(){
        let saveMember = UserData.loadMember()
        if (loginTextField.text == saveMember.userId) && (passwordTextField.text == saveMember.userPw){
            print("로그인 성공..")
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
            vcName?.modalPresentationStyle = .fullScreen
            vcName?.modalTransitionStyle = .crossDissolve
            self.present(vcName!, animated: true, completion: nil)
        } else{
            print("로그인 실패..")
        }
    }
    
    ///카카오 로그인 버튼
    @objc private func clickedKakao(){
        print("click Kakao..")
        kakaoLogin.login{[weak self] result in
            switch result {
            case .success(let oauthToken):
                print("로그인 성공..")
                print("토큰 정보: \(oauthToken)..")
            case .failure(let error):
                print("로그인 에러: \(error)..")
            }
        }
    }
}

