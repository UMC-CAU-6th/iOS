import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - 프로퍼티 만들기
    
    private lazy var num1Label: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var divLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var num2Label: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(startCounting), for: .touchUpInside)
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["First", "Second", "Third"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return control
    }()
    
    private lazy var num1Background: CustomView = {
        let view = CustomView()
        return view
    }()
    
    private lazy var divBackground: CustomView = {
        let view = CustomView()
        return view
    }()
    
    private lazy var num2Background: CustomView = {
        let view = CustomView()
        return view
    }()
    
    //MARK: - 오토레이아웃
    private func makeConstraint(){
        
        view.addSubview(segmentedControl)
        
        view.addSubview(num1Background)
        view.addSubview(divBackground)
        view.addSubview(num2Background)
        
        view.addSubview(num1Label)
        view.addSubview(divLabel)
        view.addSubview(num2Label)
        view.addSubview(startButton)
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(view)
        }
        
        num1Background.snp.makeConstraints { make in
            make.centerY.equalTo(num1Label)
            make.centerX.equalTo(num1Label)
            make.width.equalTo(num1Label.snp.width).offset(20)
            make.height.equalTo(num1Label.snp.height).offset(20)
        }
        
        divBackground.snp.makeConstraints { make in
            make.centerY.equalTo(divLabel)
            make.centerX.equalTo(divLabel)
            make.width.equalTo(divLabel.snp.width).offset(20)
            make.height.equalTo(divLabel.snp.height).offset(20)
        }
        
        num2Background.snp.makeConstraints { make in
            make.centerY.equalTo(num2Label)
            make.centerX.equalTo(num2Label)
            make.width.equalTo(num2Label.snp.width).offset(20)
            make.height.equalTo(num2Label.snp.height).offset(20)
        }
        
        num1Label.snp.makeConstraints { make in
            make.centerY.equalTo(divLabel)
            make.right.equalTo(divLabel.snp.left).offset(-10)
        }
        
        divLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        num2Label.snp.makeConstraints { make in
            make.centerY.equalTo(divLabel)
            make.left.equalTo(divLabel.snp.right).offset(10)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(divLabel.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    //MARK: - 카운트다운 버튼
    
    var num1 = 100
    var num2 = 100
    
    @objc private func startCounting() {
        DispatchQueue.global(qos: .background).async {
            while self.num1 > 0 {
                Thread.sleep(forTimeInterval: 0.5)
                self.num1 -= 1
                DispatchQueue.main.async {
                    self.num1Label.text = "\(self.num1)"
                }
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            while self.num2 > 0 {
                Thread.sleep(forTimeInterval: 2.0)
                self.num2 -= 1
                DispatchQueue.main.async {
                    self.num2Label.text = "\(self.num2)"
                }
            }
        }
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            num1Background.configureInnerViewColor(.systemTeal)
            divBackground.configureInnerViewColor(.systemTeal)
            num2Background.configureInnerViewColor(.systemTeal)
        case 1:
            num1Background.configureInnerViewColor(.orange)
            divBackground.configureInnerViewColor(.orange)
            num2Background.configureInnerViewColor(.orange)
        case 2:
            num1Background.configureInnerViewColor(.red)
            divBackground.configureInnerViewColor(.red)
            num2Background.configureInnerViewColor(.red)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        makeConstraint()
    }
}
