//
//  ViewController.swift
//  Third Doughnut
//
//  Created by 한지강 on 2024/05/01.
//
import UIKit
import SnapKit

class ViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupNavigationBar()
        configure()
        addSubView()
        autoLayout()
    }
    
    
    private let tableView : UITableView = { // 테이블 뷰 생성
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ViewController04Cell.self, forCellReuseIdentifier: ViewController04Cell.identifier)
        return tableView
    }()

    
    
    
//MARK: - 네비게이션바 버튼 4개
    private lazy var leftBtn: UIBarButtonItem = {
           let btn = UIButton()
           
           var Configuration = UIButton.Configuration.plain()
           
           var titleContainer = AttributeContainer()
           titleContainer.font = UIFont.boldSystemFont(ofSize: 20)
       
           
           Configuration.attributedTitle = AttributedString("흑석동", attributes: titleContainer)
           Configuration.image = UIImage(systemName: "chevron.down")
           Configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
           Configuration.imagePadding = 5
        Configuration.imagePlacement = .trailing
        
        btn.configuration = Configuration
//        
//        let Btn = UIButton(configuration: Configuration)
//           Btn.addTarget(self, action: #selector(btn4), for: .touchUpInside)
//        Btn.tintColor = .black
           return UIBarButtonItem(customView: btn)
       }()
    
    
    private func setupNavigationBar() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(btn1))
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(btn2))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(btn3))

        
        
        self.navigationItem.leftBarButtonItem = leftBtn
        self.navigationItem.rightBarButtonItems = [profileButton, settingButton, searchButton]

    }
    
    @objc func btn1() {
    }
    
    @objc func btn2() {
    }
    
    @objc func btn3() {
    }
    
    @objc func btn4() {
    }
}




//MARK: - 탭바 2,3

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .red
    }
}
    
    class ViewController3: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .blue
        }
        
        
        
        
}
    

//MARK: - 테이블 뷰
class ViewController04Cell : UITableViewCell {
    
    static let identifier = "ViewController04Cell"
    
    let img : UIImageView = { // 이미지 생성
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "도넛"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        contentView.addSubview(img)
        contentView.addSubview(label)
    }
    
    private func autoLayout() {
        
        img.snp.makeConstraints {
            $0.leading.top.equalTo(5)
            //$0.trailing.bottom.equalTo(-5)
            $0.size.width.height.equalTo(100)
        }
        
        label.snp.makeConstraints {
            $0.leading.equalTo(img.snp.trailing).offset(5)
            $0.top.equalTo(5)
            $0.trailing.equalTo(-5)
        }
    }
}


extension ViewController1 {
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.delegate = self
    }
    
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(20)
        }
    }
}



extension ViewController1 : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController04Cell.identifier, for: indexPath) as! ViewController04Cell
        cell.img.image = UIImage(named: "doughnut")
        cell.label.text = "가격 : 시가"
        return cell
    }
}

extension ViewController1 : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
    
    
}



