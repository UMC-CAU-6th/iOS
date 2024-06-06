//
//  MainViewController.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var item: [Item] = ItemLists.item
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        return view
    }()
    
    //MARK: - Navigation Bar
    private lazy var leftButton: UIBarButtonItem = {
        let btn = UIButton()
        var btnConfig = UIButton.Configuration.plain()
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.pretendard(size: 16, weight: .regular)
        btnConfig.attributedTitle = AttributedString("상도동", attributes: titleContainer)
        var image = UIImage(systemName: "chevron.down")
        btnConfig.image = image
        btnConfig.imagePadding = 5
        btnConfig.imagePlacement = .trailing
        
        btn.configuration = btnConfig
        btn.addTarget(self, action: #selector(clickedLeftBtn), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()
    
    private lazy var firstButton: UIBarButtonItem = {
        let firstButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(clickedFirstBtn))
        return firstButton
    }()
    
    private lazy var secondButton: UIBarButtonItem = {
        let secondButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(clickedSecondBtn))
        return secondButton
    }()
    
    private lazy var thirdButton: UIBarButtonItem = {
        let thirdButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(clickedThirdBtn))
        return thirdButton
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        setNavigationBar()
    }
    
    //MARK : function
    private func setNavigationBar() {
        navigationItem.rightBarButtonItems = [firstButton, secondButton, thirdButton]
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func clickedFirstBtn() {
        let alert = UIAlertController(title: "검색 누름", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("검색 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func clickedSecondBtn() {
        let alert = UIAlertController(title: "옵션 누름", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("옵션 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func clickedThirdBtn() {
        let alert = UIAlertController(title: "벨 누름", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("벨 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func clickedLeftBtn() {
        let modalViewController = SheetViewController()
        modalViewController.modalPresentationStyle = .pageSheet
        self.present(modalViewController, animated: true)
    }
    
    @objc func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.configure(model: item[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = item[indexPath.row]
        let lat = selectedItem.locationInfo.lat
        let lng = selectedItem.locationInfo.lng
        
        print("Selected Item Coordinates: lat: \(lat), lng: \(lng)") // 디버그 로그 추가
        
        // MapViewController로 이동
        if let mapNavVC = tabBarController?.viewControllers?[2] as? UINavigationController,
           let mapVC = mapNavVC.viewControllers.first as? MapViewController {
            mapVC.updateMapWithCoordinates(lat: Double(lat), lng: Double(lng))
            tabBarController?.selectedViewController = mapNavVC
        } else {
            print("MapViewController를 찾을 수 없습니다.")
        }
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "셀 삭제", handler: { action , view, completionHandler in
            ///원하는 액션 추가
            self.item.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        })
        
        let top = UIContextualAction(style: .normal, title: "가장 위로", handler: { action , view, completionHandler in
            ///원하는 액션 추가
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            completionHandler(true)
        })
        
        ///각 ContextualAction 대한 설정
        delete.backgroundColor = .systemBlue
        delete.image = UIImage(systemName: "trash.fill")
        top.backgroundColor = .systemRed
        top.image = UIImage(systemName: "chevron.up.square.fill")
        
        // UISwipeActionsConfiguration에 action을 추가하여 리턴
        return UISwipeActionsConfiguration(actions: [delete, top])
    }
}

