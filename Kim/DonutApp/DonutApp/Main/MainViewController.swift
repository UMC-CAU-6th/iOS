//
//  MainViewController.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    var donutData: [Item] = DonutData.dataList
    //MARK: - Table view
    ///테이블뷰
    ///테이블뷰에 cell 등록 해줘야 함(register)
    ///할당 받고(self로) extension으로 위임 받은 거 선언해야 함
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.refreshControl = UIRefreshControl()
        tv.refreshControl?.tintColor = UIColor.blue
        tv.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        return tv
    }()
    
    //MARK: - Navigation
    ///왼쪽 장소 버튼
    private lazy var leftArrowBtn: UIBarButtonItem = {
        let btn = UIButton()
        var configure = UIButton.Configuration.plain()
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .strokeColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        configure.attributedTitle = AttributedString("송파동",attributes: AttributeContainer(textAttributes))
        if let originalImage = UIImage(named: "arrow") {
            let grayImage = originalImage.withTintColor(.gray, renderingMode: .alwaysOriginal)
            configure.image = grayImage
        }
        configure.imagePlacement = .trailing
        configure.imagePadding = 7
        btn.configuration = configure
        btn.addTarget(self, action: #selector(clickedArrow), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()
    ///돋보기
    private lazy var searchBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(named: "search")
        btn.target = self
        btn.tintColor = .gray
        btn.action = #selector(clickedSearch)
        return btn
    }()
    ///옵션
    private lazy var optionBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(named: "option")
        btn.target = self
        btn.tintColor = .gray
        btn.action = #selector(clickedOption)
        return btn
    }()
    ///알림
    private lazy var noticeBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(named: "notice")
        btn.target = self
        btn.tintColor = .gray
        btn.action = #selector(clickedNotice)
        return btn
    }()
    
    //MARK: - Refresh
    private lazy var rfCon: UIRefreshControl = {
        let rf = UIRefreshControl()
        rf.tintColor = .gray
        rf.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        return rf
    }()
    
    //MARK: - Modal
    private lazy var modalView: UIViewController = {
        let mv = UIViewController()
        mv.view.backgroundColor = .yellow
        mv.modalPresentationStyle = .fullScreen
        let closeBtn = UIButton(type: .system)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        closeBtn.tintColor = .gray
        closeBtn.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        mv.view.addSubview(closeBtn)
        NSLayoutConstraint.activate([
            closeBtn.trailingAnchor.constraint(equalTo: mv.view.trailingAnchor, constant: -30),
            closeBtn.topAnchor.constraint(equalTo: mv.view.topAnchor, constant: 60)
        ])
        return mv
    }()
    
    //MARK: - Init
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.tableView.refreshControl = rfCon
        setNavigationBar()
        makeConstraints()
        tableView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - Function
    ///네비게이션 함수
    private func setNavigationBar() {
        self.navigationItem.leftBarButtonItem = leftArrowBtn
        self.navigationItem.rightBarButtonItems = [searchBtn, optionBtn, noticeBtn]
    }
    ///테이블뷰 offset
    private func makeConstraints() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints{ make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(25)
        }
    }
    ///새로고침
    @objc private func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    ///버튼
    @objc func clickedArrow() {
        present(modalView, animated: true)
    }
    @objc func clickedSearch() {
    }
    @objc func clickedOption() {
    }
    @objc func clickedNotice() {
    }
    @objc func closeModal() {
        modalView.dismiss(animated: true, completion: nil)
    }
}
//MARK: - Extension
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donutData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
        cell.addData(model: donutData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDonut = donutData[indexPath.row]
        let mapVC = MapViewController()
        mapVC.selectedDonut = selectedDonut
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action1=UIContextualAction(style: .normal, title: "delete", handler: {action,view,completionHandler in
            self.donutData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        })
        let action2=UIContextualAction(style: .normal, title: "top", handler: {action,view,completionHandler in
            self.donutData.insert(self.donutData[indexPath.row], at: 0)
            self.donutData.remove(at: indexPath.row+1)
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            completionHandler(true)
        })
        action1.backgroundColor = .systemRed
        action2.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action1,action2])
    }
}
