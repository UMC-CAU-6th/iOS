//
//  TableViewCell.swift
//  DonutApp
//
//  Created by 김나연 on 5/2/24.
//
///셀 파일- 테이블뷰 한 칸만을 위한 파일(껍데기)
///1. .swift로 새 파일 생성하는 게 아니고 cocoa로 파일 생성하기
///2. 초기화 table view가 다 가져갈 수 있게 초기화하는 것
///as 구문 type을 맞춰줌..(눈높이 내리기)
///scenedelegate->tabcontroller->navigationcontroller->(home/map/basket)
import UIKit

class TableViewCell: UITableViewCell {

    ///cell은 재사용해야함! 그러므로 static을 키워드로 사용
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Exit..")
    }
    
    //MARK: - 데이터 받기
    
}
