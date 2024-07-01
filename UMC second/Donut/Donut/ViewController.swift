import UIKit
import SnapKit

class ViewController: UIViewController {
    let idTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "아이디"
           textField.borderStyle = .roundedRect
           return textField
       }()
    
    let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "비밀번호"
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            return textField
        }()
    
    let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("로그인", for: .normal)
            return button
        }()
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(idTextField)
              idTextField.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([
                  idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  idTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                  idTextField.widthAnchor.constraint(equalToConstant: 200)
              ])
        
        view.addSubview(passwordTextField)
               passwordTextField.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
                   passwordTextField.widthAnchor.constraint(equalToConstant: 200)
               ])
       
        view.addSubview(loginButton)
               loginButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
               ])
        
        imageView.image = UIImage(named: "donut")
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
