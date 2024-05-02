import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTitle()
    }
    
    //MARK: - 버튼만들기
    
    ///YES 버튼
    private lazy var Btn: UIButton = {
        let btn = UIButton()
        
        var Configuration = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.boldSystemFont(ofSize: 20)
        
        var subtitleContainer = AttributeContainer()
        subtitleContainer.foregroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        Configuration.attributedTitle = AttributedString("YES", attributes: titleContainer)
        Configuration.image = UIImage(systemName: "y.circle")
        Configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        Configuration.imagePadding = 5
        Configuration.titleAlignment = .leading
        let Btn = UIButton(configuration: Configuration)
        Btn.addTarget(self, action: #selector(clickedYes), for: .touchUpInside)
        return Btn
    }()
    
    ///NO 버튼
    private lazy var Btn2: UIButton = {
        let btn2 = UIButton()
        
        var Configuration = UIButton.Configuration.tinted()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.boldSystemFont(ofSize: 20)
    
        
        Configuration.attributedTitle = AttributedString("NO", attributes: titleContainer)
        
        Configuration.titleAlignment = .leading
        let Btn2 = UIButton(configuration: Configuration)
        Btn2.addTarget(self, action: #selector(clickedNo), for: .touchUpInside)
        return Btn2
    }()
    
    
    ///버튼 레이아웃
    private func setTitle() {
        self.view.addSubview(Btn)
        self.view.addSubview(Btn2)
        
        Btn.translatesAutoresizingMaskIntoConstraints = false
        Btn2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            Btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            Btn.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)
        ])
        
        Btn2.snp.makeConstraints { make in
            make.centerY.equalTo(Btn)
            make.left.equalTo(Btn.snp.right).offset(20)
        }
        
        
    }
    
    
    //MARK: - 동작과 Alert
    @objc private func clickedYes() {
        checkLogin(for: "Yes를 선택하셨습니다.")
    }

    @objc private func clickedNo() {
        checkLogin(for: "No를 선택하셨습니다.")
    }
    
    
    private func checkLogin(for title: String) {
        let alert = UIAlertController(title: "login", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("알림창 확인 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
