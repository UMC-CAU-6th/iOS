//
//  TableCell.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//
///option 누르고 변수 클릭, command+shift+0
///셀 파일- 테이블뷰 한 칸만을 위한 파일
///1. .swift로 새 파일 생성하는 게 아니고 cocoa(?)로 파일 생성하기
///2. 초기화 table view가 다 가져갈 수 있게 초기화하는 것
import Foundation
import UIKit
import SnapKit

class TableCell: UITableViewCell {
    let imgView = UIImageView()
    let nameLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        [imgView, nameLabel].forEach {
            contentView.addSubview($0)
        }
        imgView.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.width.height.equalTo(50)
        }
            
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(imgView)
            make.leading.equalTo(imgView.snp.trailing).offset(10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(iamge: UIImage, name: String) {
        
    }
}
