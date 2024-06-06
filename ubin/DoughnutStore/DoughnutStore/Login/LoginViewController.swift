//
//  LoginViewController.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private lazy var kakaoLoginManager = KakaoLoginManager()
    private let member = MemberData(userId: "ubin", userPw: "0047")
    
    //MARK: - Title
    
    ///도넛 이미지
    private lazy var titleImage: UIImageView = {
        let img = UIImageView()
        let image = UIImage(named: "titleImage.png")
        img.image = image
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    
    ///로그인 서브타이틀
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.text = "It's my"
        label.textColor = .black
        label.font = UIFont.pretendard(size: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    ///로그인 메인타이틀
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Doughnut!!!"
        label.textColor = .black
        label.font = UIFont.pretendard(size: 40, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    ///로그인 서브타이틀2
    private lazy var subTitle2: UILabel = {
        let label = UILabel()
        label.text = "If you want donuts, come with me"
        label.textColor = .black
        label.font = UIFont.pretendard(size: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Member
    private func createMember(placeholder: String) -> UITextField {
        let text = UITextField()
        text.borderStyle = .roundedRect
        text.autocorrectionType = .no
        text.clearButtonMode = .whileEditing
        text.returnKeyType = .done
        text.font = UIFont.pretendard(size: 16, weight: .regular)
        
        let placeholder = placeholder
        text.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font: UIFont.pretendard(size: 12, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
        return text

    }
    
    ///회원 아이디 입력
    private lazy var memberID: UITextField = {
        return createMember(placeholder: "Your ID")
    }()
    
    private lazy var memberPW: UITextField = {
        return createMember(placeholder: "Your PASSWORD")
    }()
    
    //MARK: - Login
    ///일반 로그인 버튼
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        /*버튼 Configuration*/
        var btnConfig = UIButton.Configuration.filled()
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.pretendard(size: 16, weight: .bold)
        btnConfig.attributedTitle = AttributedString("Login", attributes:titleContainer)
        btnConfig.baseBackgroundColor = UIColor(red: 0.2588, green: 0.149, blue: 0.102, alpha: 1.0)
        btnConfig.background.cornerRadius = 47
        btnConfig.baseForegroundColor = .white
      
        
        
        btn.configuration = btnConfig
        
        /*버튼 액션 타겟*/
        btn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        return btn
    }()
    
    ///카카오 로그인 버튼
    private lazy var kakaoLogin: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "kakaoLogin.png")
        
        image.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickedKakao))
        image.addGestureRecognizer(tap)
        image.image = img
        return image
    }()
    
    
    //MARK: - Stack
    private func createStackView(_ space: CGFloat, _ distribution: UIStackView.Distribution) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = distribution
        stack.spacing = space
        return stack
    }
    
    private lazy var titleStack: UIStackView = {
        return createStackView(0, .fillEqually)
    }()
    
    private lazy var loginStack: UIStackView = {
        return createStackView(5, .fillEqually)
    }()
    
    private lazy var loginBtnStack: UIStackView = {
        return createStackView(5, .fillEqually)
    }()
    
    
    //MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        /* 회원 정보 저장 */
        member.setMember()
        
        /* 프로퍼티 요소 추가 */
        addStackProperty()
        addProperty()
        makeConstraints()
        
    }
    
    
    //MARK: - ConstraintsFunction
    
    ///프로퍼티 뷰 추가
    private func addStackProperty() {
        titleStack.addArrangedSubview(subTitle)
        titleStack.addArrangedSubview(loginTitle)
        titleStack.addArrangedSubview(subTitle2)
        
        loginStack.addArrangedSubview(memberID)
        loginStack.addArrangedSubview(memberPW)
        
        loginBtnStack.addArrangedSubview(loginBtn)
        loginBtnStack.addArrangedSubview(kakaoLogin)
    }
    
    /// 프로퍼티 추가 함수
    private func addProperty() {
        [titleImage, titleStack, loginStack, loginBtnStack].forEach {
            self.view.addSubview($0)
        }
    }

    ///오토레이아웃 조정
    private func makeConstraints() {
        ///타이틀 이미지
        titleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.height.lessThanOrEqualTo(399)
        }
        
        ///타이틀 문구
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(0)
            make.bottom.equalTo(loginStack.snp.top).offset(-10)
            make.height.lessThanOrEqualTo(160)
            make.centerX.equalToSuperview()
            
            subTitle.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
            }
            loginTitle.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(subTitle.snp.bottom).offset(0)
            }
            subTitle2.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(loginTitle.snp.bottom).offset(0)
            }
        }
        
        ///로그인 스택
        loginStack.snp.makeConstraints { make in
            
            make.top.equalTo(titleStack.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginBtnStack.snp.top).offset(-30)
            
            make.width.greaterThanOrEqualTo(257)
            make.height.lessThanOrEqualTo(95)
            
            memberID.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.lessThanOrEqualTo(45)
            }
            memberPW.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(memberID.snp.bottom).offset(10)
                make.height.lessThanOrEqualTo(45)
            }
        }
        
        ///로그인 버튼
        loginBtnStack.snp.makeConstraints { make in

            
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.centerX.equalToSuperview()
            
            make.width.lessThanOrEqualTo(361) /// 왜 make.width.lessThanOrEqualTo로 하면 안될까?
            make.height.lessThanOrEqualTo(117)
            
            loginBtn.snp.makeConstraints { make in
                make.width.greaterThanOrEqualTo(361)
                make.height.greaterThanOrEqualTo(50)
            }
            
            kakaoLogin.snp.makeConstraints { make in
                make.width.lessThanOrEqualTo(361)
                make.height.lessThanOrEqualTo(50)
            }
        }
    }
    
    
    //MARK: - BtnAction
    //로그인 버튼 액션
    @objc private func clickedLogin() {
        let saveMember = MemberData.loadMember()
        
        if(memberID.text == saveMember.userId) && (memberPW.text == saveMember.userPw) {
            checkLogin()
        } else {
            print("Wrong ID or PW")
        }
    }
    
    
    //카카오버튼 클릭 액션
    @objc private func clickedKakao() {
        
        print("카카오 클릭")
        
        kakaoLoginManager.login { [weak self] result in
            switch result {
            case .success(let oauthToken):
                print("로그인 성공")
                print("토큰 정보 : \(oauthToken)")
                self?.checkLogin()
            case .failure(let error):
                print("로그인 에러 : \(error)")
            }
        }
        
    }
    
    // MARK: - Alert
    
    /// 로그인 성공시 작동하게 될 Alert
    private func checkLogin() {
        let rootVC = TabBarController()
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        guard let delegate = sceneDelegate else {
            // 에러 알림
            print("rootViewController 전환 Error")
            return
        }
        delegate.window?.rootViewController = rootVC
    }
}
