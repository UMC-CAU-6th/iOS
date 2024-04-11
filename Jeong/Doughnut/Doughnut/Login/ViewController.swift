//
//  ViewController.swift
//  Doughnut
//
//  Created by 정의찬 on 4/5/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var settingCheck = SettingCheck()
    private lazy var kakaoLoginManager = KakaoLoginManager()
    private let member = MemberData(userId: "UMC", userPw: "q1234")
    
    
    //MARK: - Title
    
    ///도넛 이미지
    private lazy var titleImage: UIImageView = {
        let img = UIImageView()
        let image = UIImage(named: "titleImage.png")
        img.image = image
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    /// 로그인 타이틀
    private lazy var titleLogin: UILabel = {
        let label = UILabel()
        label.text = "Let's Doughnut"
        label.textColor = .black
        label.font = .pretendard(size: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    /// 서브 타이틀
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.text = "당신의 달콤한 순간을 위한 도넛"
        label.textColor = .gray
        label.font = .pretendard(size: 17, weight: .medium)
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
        text.font = UIFont.pretendard(size: 13, weight: .regular)
        
        let placeholder = placeholder
        text.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [
                                                            NSAttributedString.Key.font: UIFont.pretendard(size: 13, weight: .regular),
                                                            NSAttributedString.Key.foregroundColor: UIColor.gray
                                                        ])
        return text
    }
    
    /// 회원 아이디 입력
    private lazy var memberId: UITextField = {
        return createMember(placeholder: "아이디를 입력해주세요!!")
    }()
    
    /// 비번
    private lazy var memberPw: UITextField = {
        return createMember(placeholder: "비밀번호를 입력해주세요!!")
    }()
    
    
    //MARK: - Login
    /// 로그인 하기 버튼
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        /* 버튼 Configuration */
        var btnConfiguration = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.pretendard(size: 12, weight: .medium)
        
        btnConfiguration.attributedTitle = AttributedString("로그인", attributes: titleContainer)
        btn.configuration = btnConfiguration
        
        /* 버튼 액션 타켓 */
        btn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        return btn
    }()
    
    /// 카카오 로그인 버튼
    private lazy var kakaoLogin: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "kakaoLogin.png")
        
        image.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickdKakao))
        image.addGestureRecognizer(tapGesture)
        
        image.image = img
        return image
    }()
    
    
    // MARK: - Stack
    
    /// 스택 중복 코드 생성
    private func createStackView(_ space: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = space
        return stack
    }
    
    /// 상단 타이틀 스택 뷰
    private lazy var titleStack: UIStackView = {
        return createStackView(5)
    }()
    
    /// 로그인 타이틀 스택 뷰
    private lazy var loginStack: UIStackView = {
        return createStackView(10)
        
    }()
    
    /// 로그인 버튼 스택
    private lazy var loginBtnStack: UIStackView = {
        return createStackView(15)
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        
        /* 폰트 출력 */
        settingCheck.checkFont()
        
        /* 회원 정보 저장 */
        member.setMember()
        
        /* 프로퍼티 요소 추가 */
        addStackProperty()
        addProperty()
        makeConstraints()
    }
    
    // MARK: - ConstraintsFuntion
    
    
    /// 프로퍼티 뷰 추가 함수
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
    
    /// 오토레이아웃 조정
    private func makeConstraints() {
        titleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(135)
            make.right.equalToSuperview().offset(-134)
            
            make.top.equalToSuperview().offset(200)
            make.height.lessThanOrEqualTo(154)
        }
        
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            
            make.width.greaterThanOrEqualTo(120)
            make.height.lessThanOrEqualTo(100)
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
    
    // MARK: - BtnAction
    
    /// 로그인 버튼 액션
    @objc private func clickedLogin() {
        let saveMember = MemberData.loadMember()
        
        if (memberId.text == saveMember.userId) && (memberPw.text == saveMember.userPw) {
            checkLogin(for: "일반 로그인에 성공했습니다.")
        } else {
            print("회원정보 틀림!!")
            print(saveMember.userId)
            print(saveMember.userPw)
        }
    }
    
    /// 카카오버튼 클릭
    @objc private func clickdKakao() {
        
        print("카카오 클릭")
        
        kakaoLoginManager.login { [weak self] result in
            switch result {
            case .success(let oauthToken):
                print("로그인 성공")
                print("토큰 정보 : \(oauthToken)")
                self?.checkLogin(for: "카카오톡 로그인에 성공했습니다.")
            case .failure(let error):
                print("로그인 에러 : \(error)")
            }
        }
    }
    
    // MARK: - Alert
    
    /// 로그인 성공시 작동하게 될 Alert
    private func checkLogin(for title: String) {
        let alert = UIAlertController(title: "login", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("알림창 확인 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
