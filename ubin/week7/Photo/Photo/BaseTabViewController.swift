import UIKit
import SnapKit

class BaseTabViewController: UIViewController, PhotoPickerProtocol {
    
    //MARK: - UI
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        /*버튼 Configuration*/
        var btnConfig = UIButton.Configuration.filled()
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 14)
        btnConfig.attributedTitle = AttributedString("버튼", attributes: titleContainer)
        btnConfig.baseBackgroundColor = UIColor.systemBlue
        btnConfig.baseForegroundColor = .white
      
        button.configuration = btnConfig
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(image)
        view.addSubview(button)
        makeConstraint()
        
        configureButton(color: buttonColor, buttonTitle: buttonTitle)
    }
    
    // MARK: - Constraint
    private func makeConstraint() {
        image.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(150)
        }
    }
    
    // MARK: - func
    func configureButton(color: UIColor, buttonTitle: String) {
        var btnConfig = self.button.configuration
        btnConfig?.baseBackgroundColor = color
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 14)
        btnConfig?.attributedTitle = AttributedString(buttonTitle, attributes: titleContainer)
        self.button.configuration = btnConfig
        
        self.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func didSelectPhoto(image img: UIImage) {
        image.image = img
    }
    
    // MARK: - Override Properties
    var buttonColor: UIColor {
            return .systemBlue
        }
        
        var buttonTitle: String {
            return "버튼"
        }
    
    // MARK: - Event Listener
    @objc private func buttonTapped() {
        presentPhotoPicker()
        }
}


