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
    //MARK: - Table view
    ///테이블뷰
    ///테이블뷰에 cell 등록 해줘야 함(register)
    ///할당 받고(self로) extension으로 위임 받은 거 선언해야 함
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    ///이미지뷰
    private lazy var tableImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "donut icon")
        return img
    }()
    
    ///라벨
    private lazy var tableLabel : UILabel = {
        let lb = UILabel()
        lb.text = "dd"
        return lb
    }()
    
    //MARK: - Init
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
}
