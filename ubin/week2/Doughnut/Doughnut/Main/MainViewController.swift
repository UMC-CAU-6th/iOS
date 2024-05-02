//
//  MainViewController.swift
//  Doughnut
//
//  Created by 황유빈 on 5/2/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let item: [Item] = ItemLists.item
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .editingChanged)
        return view
    }()
    
    //MARK: - Navigation Bar
    private func makeNavigationBar() {
        let firstButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(clickedFirstBtn))
        let secondButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(clickedSecondBtn))
        let thirdButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(clickedThirdBtn))
        
        let leftButton1 = UIBarButtonItem(title: "상도동", style: .plain, target: self, action: #selector(clickedLeftBtn))
        let leftButton2 = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(clickedLeftBtn))
        
        navigationItem.rightBarButtonItems = [firstButton, secondButton, thirdButton]
        navigationItem.leftBarButtonItems = [leftButton1, leftButton2]
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
        let alert = UIAlertController(title: "지역 설정 누름", message: title, preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "확인", style: .default) { _ in
            print("지역 설정 누름")
        }
        
        alert.addAction(successAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        makeNavigationBar()
        
    }
    
    @objc func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
}

