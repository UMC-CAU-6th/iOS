//
//  MainViewController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/6/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    
    var doughnutData: [Item] = DoughnutData.dataList
    
    
    
    
    //MARK: - Property
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.tintColor = UIColor.gray
        view.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        return view
    }()
    
    
    ///네비게이션 바
    private lazy var leftTownBtn: UIBarButtonItem = {
        let btn = UIButton()
        var configure = UIButton.Configuration.plain()
        let attributeString: [NSAttributedString.Key: Any] = [
            .font: UIFont.NanumGothic(size: 16, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        configure.attributedTitle = AttributedString("흑석동", attributes: AttributeContainer(attributeString))
        configure.image = UIImage(systemName: "chevron.down")
        configure.imagePlacement = .trailing
        configure.imagePadding = 5
    
        btn.configuration = configure
        
        btn.addTarget(self, action: #selector(clickedTown), for: .touchUpInside)
        
        return UIBarButtonItem(customView: btn)
    }()
    
    
    private lazy var rightSearchBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "magnifyingglass")
        btn.target = self
        btn.action = #selector(clickedsearch)
        return btn
    }()
    
    private lazy var rightMenuBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "list.bullet")
        btn.target = self
        btn.action = #selector(clickedmenu)
        return btn
    }()
    
    
    
    private lazy var rightBellBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "bell")
        btn.target = self
        btn.action = #selector(clickedBell)
        return btn
    }()
    
    
    
    
    //MARK: - 오토레이아웃 설정
    
    private func makeConstraints() {
        
        self.view.addSubview(tableView
        )
        
        tableView.snp.makeConstraints{ make in
            make.left.right.top.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.leftBarButtonItem = leftTownBtn
        self.navigationItem.rightBarButtonItems = [rightBellBtn, rightMenuBtn, rightSearchBtn]
    }
    
    private func alertMessage(for message: String) {
        let alertControll = UIAlertController(title: "버튼 클릭", message: message, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("버튼을 눌렀어요!")
        }
        
        alertControll.addAction(successAction)
        self.present(alertControll, animated: true, completion: nil)
    }
    
    @objc private func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - 버튼 액션
    
    @objc func clickedsearch() {
        self.alertMessage(for: "돋보기")
    }
    
    @objc func clickedmenu() {
        self.alertMessage(for: "메뉴")
    }
    
    @objc func clickedBell() {
        self.alertMessage(for: "벨")
    }
    
    @objc func clickedTown() {
            let yellowVC = yellowSheetViewController()
            let navController = UINavigationController(rootViewController: yellowVC)
            navController.modalPresentationStyle = .pageSheet
            present(navController, animated: true, completion: nil)
        }
    
   

    
    //MARK: - VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setNavigationBar()
        makeConstraints()
        
    }
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doughnutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(model: doughnutData[indexPath.row])
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        let items: [Item] = DoughnutData.dataList
        let item = items[indexPath.row]
            if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 2 // 지도탭으로 이동
                
                if let mapViewController = tabBarController.viewControllers?[2] as? MapViewController {
                    mapViewController.moveToLocation(latitude: Double(item.locationInfo.lat), longitude: Double(item.locationInfo.lng))
                }
            }
        }
    
    
    //MARK: - 4주차 과제 셀 최상단 or 삭제
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
             self?.deleteItem(at: indexPath)
             completionHandler(true)
         }
         deleteAction.backgroundColor = .red
         deleteAction.image = UIImage(systemName: "trash")
         
         let addAction = UIContextualAction(style: .normal, title: "move to Top") { [weak self] (action, view, completionHandler) in
             self?.addItemToTop(at: indexPath)
             completionHandler(true)
         }
         addAction.backgroundColor = .systemBlue
         addAction.image = UIImage(systemName: "arrow.up.to.line")
         
         return UISwipeActionsConfiguration(actions: [deleteAction, addAction])
     }

     func deleteItem(at indexPath: IndexPath) {
         doughnutData.remove(at: indexPath.row)
         tableView.beginUpdates()
         tableView.deleteRows(at: [indexPath], with: .fade)
         tableView.endUpdates()
     }

     func addItemToTop(at indexPath: IndexPath) {
         let itemToMove = doughnutData[indexPath.row]
         doughnutData.remove(at: indexPath.row)
         doughnutData.insert(itemToMove, at: 0)
         
         tableView.beginUpdates()
         tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: indexPath.section))
         tableView.endUpdates()
     }
 }
