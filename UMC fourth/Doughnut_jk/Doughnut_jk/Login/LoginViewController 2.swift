//
//  LoginViewController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {

    private lazy var settingCheck = SettingCheck()
    private lazy var kakaoLoginManager = KakaoLoginManager()
    let member = MemberData(userId: "", userPw: "")
    
    //MARK: - title
    ///타이틀 이미지
    private lazy var titleImage: UIImageView = {
        let img = UIImageView()
        let image = UIImage(named: "titleImage.png")
        img.image = image
        img.contentMode = .scaleAspectFit
        return img
        
    }()
    
    
    ///타이틀
    private lazy var titleLogin: UILabel = {
        let label = UILabel()
        label.text = "Five Doughnut"
        label.textColor = .systemRed
        label.font = .NanumGothic(size: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.text = "국민 도넛 FIVE DOUGHNUTS!"
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
  
    //MARK: - 로그인 텍스트 필드
    
    ///텍스트 필드
    private func createMember(placeholder: String) -> UITextField {
        let text = UITextField()
        text.borderStyle = .roundedRect
        text.autocorrectionType = .no
        text.clearButtonMode = .whileEditing
        text.returnKeyType = .done
        text.font = UIFont.NanumGothic(size: 13, weight: .regular)
        
        let placeholder = placeholder
        text.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [
                                                            NSAttributedString.Key.font: UIFont.NanumGothic(size: 13, weight: .regular),
                                                            NSAttributedString.Key.foregroundColor: UIColor.gray
                                                        ])
        
        return text
    }
    
    /// 아이디
    private lazy var memberId: UITextField = {
        return createMember(placeholder: "아이디")
    }()
    
    /// 비밀번호
    private lazy var memberPw: UITextField = {
        return createMember(placeholder: "비밀번호")
    }()
    
    
    //MARK: - LoginBtn
    ///로그인 버튼
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        var btnConfiguration = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.NanumGothic(size: 12, weight: .regular)
        
        btnConfiguration.attributedTitle = AttributedString("로그인", attributes: titleContainer)
        btn.configuration = btnConfiguration
        btn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var kakaoLogin: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "kakaoLogin.png")
            
        image.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickdKakao))
        image.addGestureRecognizer(tapGesture)
        
        image.image = img
        return image
    }()
    
    
    
    
    
    
    //MARK: - StackView
    
    private func stackView(_ space: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = space
        return stack
    }
    
    
    private lazy var titleStack: UIStackView = {
        return stackView(10)
    }()
    
    private lazy var loginStack: UIStackView = {
        return stackView(10)
    }()
    
    private lazy var loginBtnStack: UIStackView = {
        return stackView(15)
    }()
    
    
   
    private func addStackProperty() {
        titleStack.addArrangedSubview(titleLogin)
        titleStack.addArrangedSubview(subTitle)
        
        loginStack.addArrangedSubview(memberId)
        loginStack.addArrangedSubview(memberPw)
        
        loginBtnStack.addArrangedSubview(loginBtn)
        loginBtnStack.addArrangedSubview(kakaoLogin)
    }
    
    /// 프로퍼티 추가 함수
    private func addProperty() {
        [titleImage, titleStack, loginStack, loginBtnStack].forEach {
            self.view.addSubview($0)
        }
    }
    
    //MARK: - 오토레이아웃 설정
    /// 오토레이아웃 조정
    private func makeConstraints() {
        titleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(135)
            make.right.equalToSuperview().offset(-134)
            make.top.equalToSuperview().offset(100)
            make.width.greaterThanOrEqualTo(200)
            make.height.lessThanOrEqualTo(200)
        }
        
        
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            
            make.width.greaterThanOrEqualTo(300)
            make.height.lessThanOrEqualTo(200)
        }
        
        /* 로그인 스택 내부 */
        loginStack.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            
            make.width.greaterThanOrEqualTo(240)
            make.height.lessThanOrEqualTo(110)
        }
        
        
        [memberId, memberPw].forEach { member in
            member.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().offset(0)
            }
        }
        
        /* 로그인 버튼 내부*/
        loginBtnStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
            
            make.width.lessThanOrEqualTo(240)
            make.height.lessThanOrEqualTo(150)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.greaterThanOrEqualTo(35)
        }
        
        kakaoLogin.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.lessThanOrEqualTo(35)
        }
    }
    
    
    //MARK: - 버튼클릭시 액션
    
    /// 로그인 버튼 클릭시 정보 맞으면 로그인, 아니면 다시입력
    @objc private func clickedLogin() {
        let saveMember = MemberData.loadMember()
        
        if (memberId.text == saveMember.userId) && (memberPw.text == saveMember.userPw) {
            changeRootView()
        } else {
            print("다시 입력해주세요")
            print(saveMember.userId)
            print(saveMember.userPw)
        }
    }
    
    
    
    /// 카카오버튼 클릭
    @objc private func clickdKakao() {
        
        print("카카오 클릭")
        
        kakaoLoginManager.login { result in
            switch result {
            case .success(let oauthToken):
                print("로그인 성공")
                print("토큰 정보 : \(oauthToken)")
                self.changeRootView()
            case .failure(let error):
                print("로그인 에러 : \(error)")
            }
        }
    }
    
    // MARK: - Alert
    
    private func checkLogin(for title: String) {
        let alert = UIAlertController(title: "login", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("알림창 확인 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        settingCheck.checkFont()
        
        addStackProperty()
        addProperty()
        makeConstraints()
        
        member.setMember()
        let saveMember = MemberData.loadMember()
        print("저장된 회원 데이터: \(saveMember)")

        /*디버깅용
        print("입력된 아이디: \(memberId.text ?? "")")
        print("입력된 비밀번호: \(memberPw.text ?? "")")
        print("저장된 아이디: \(saveMember.userId)")
        print("저장된 비밀번호: \(saveMember.userPw)")
       */
    }
    

    
    //MARK: - 루트뷰 전환
    
    private func changeRootView() {
        let rootVC = DoughnutTabBarController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = window.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    
    
}
