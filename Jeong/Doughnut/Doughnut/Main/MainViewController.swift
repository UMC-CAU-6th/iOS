//
//  MainViewController.swift
//  Doughnut
//
//  Created by 정의찬 on 5/1/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController{
    
    let doughnutData: [Item] = DoughnutData.dataList
    
    
    // MARK: - Property
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(DoughnutTableCell.self, forCellReuseIdentifier: DoughnutTableCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.tintColor = UIColor.red
        view.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        return view
    }()
    
    
    // MARK: - NavigationButton
    private lazy var leftTownBtn: UIBarButtonItem = {
        let btn = UIButton()
        var configure = UIButton.Configuration.plain()
        let attributeString: [NSAttributedString.Key: Any] = [
            .font: UIFont.pretendard(size: 16, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        configure.attributedTitle = AttributedString("흑성동", attributes: AttributeContainer(attributeString))
        configure.image = UIImage(systemName: "chevron.down")
        configure.imagePlacement = .trailing
        configure.imagePadding = 5
    
        btn.configuration = configure
        
        btn.addTarget(self, action: #selector(clicedTown), for: .touchUpInside)
        
        return UIBarButtonItem(customView: btn)
    }()
    
    // MARK: - NaviRightButtonProperty
    
    /// 오른쪽 돋보기
    private lazy var rightGlassBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "magnifyingglass")
        btn.target = self
        btn.action = #selector(clickedGlass)
        return btn
    }()
    
    /// 오룬쪽 옵션
    private lazy var rightOptionBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "list.bullet")
        btn.target = self
        btn.action = #selector(clickedOption)
        return btn
    }()
    
    
    /// 오른쪽 벨
    private lazy var rightBellBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "bell")
        btn.target = self
        btn.action = #selector(clickedBell)
        return btn
    }()
    
    // MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setNavigationBar()
        makeConstraints()
    }
    
    // MARK: - Function
    
    private func makeConstraints() {
        
        self.view.addSubview(tableView
        )
        
        tableView.snp.makeConstraints{ make in
            make.left.right.top.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
        }
    }
    
    /// 네비게이션 위치 설정 함수
    private func setNavigationBar() {
        self.navigationItem.leftBarButtonItem = leftTownBtn
        self.navigationItem.rightBarButtonItems = [rightBellBtn, rightOptionBtn, rightGlassBtn]
    }
    
    private func alertMessage(for message: String) {
        let alertControll = UIAlertController(title: "버튼 클릭", message: message, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("버튼을 눌렀어요!")
        }
        
        alertControll.addAction(successAction)
        self.present(alertControll, animated: true, completion: nil)
    }
    
    /// 리프레시 컨트롤
    @objc private func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - ButtonObjc
    
    @objc func clickedGlass() {
        self.alertMessage(for: "돋보기 버튼 눌렀어요!")
    }
    
    @objc func clickedOption() {
        self.alertMessage(for: "옵션 버튼 눌렀어요!")
    }
    
    @objc func clickedBell() {
        self.alertMessage(for: "벨 버튼 눌렀어요!")
    }
    
    @objc func clicedTown() {
        self.alertMessage(for: "장소 버튼을 눌렀어요!")
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doughnutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DoughnutTableCell.identifier, for: indexPath) as? DoughnutTableCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(model: doughnutData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}
