//
//  MainTableViewCell.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - image
    private lazy var donutImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    //MARK: - info
    ///도넛 이름
    private lazy var donutName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.pretendard(size: 13, weight: .bold)
        name.textAlignment = .center
        return name
    }()
    
    ///도넛 가격
    private lazy var donutPrice: UILabel = {
        let price = UILabel()
        price.textColor = .black
        price.font = UIFont.pretendard(size: 16, weight: .regular)
        price.textAlignment = .center
        return price
    }()
    
    ///하트
    private lazy var heart: UIImageView = {
        let image = UIImageView()
        let img = UIImage(systemName: "heart")
        
        image.image = img
        return image
    }()
    
    ///하트 카운트
    private lazy var heartCount: UILabel = {
        let count = UILabel()
        count.text = "10"
        count.textColor = .black
        count.font = UIFont.pretendard(size: 12, weight: .regular)
        count.textAlignment = .left
        return count
    }()
    
    //MARK: - Stack
    ///하트 스택
    private lazy var heartStack: UIStackView = {
        let heartStack = UIStackView()
        heartStack.axis = .horizontal
        heartStack.alignment = .center
        heartStack.spacing = 1
        return heartStack
    }()
    
    //MARK: - Constraints
    ///프로퍼티 뷰 추가
    private func addProperty() {
        self.contentView.addSubview(donutImage)
        self.contentView.addSubview(donutName)
        self.contentView.addSubview(donutPrice)
        heartStack.addArrangedSubview(heart)
        heartStack.addArrangedSubview(heartCount)
        self.contentView.addSubview(heartStack)
    }
    
    ///오토레이아웃
    private func makeConstraints() {
        
        /* 도넛 이미지 */
        donutImage.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.width.height.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
        /* 도넛 이름 */
        donutName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalTo(donutImage.snp.trailing).offset(10)
            make.width.lessThanOrEqualTo(120)
            make.height.lessThanOrEqualTo(50)
        }
        
        /* 도넛 가격 */
        donutPrice.snp.makeConstraints { make in
            make.top.equalTo(donutName.snp.bottom).offset(10)
            make.leading.equalTo(donutImage.snp.trailing).offset(10)
            make.width.lessThanOrEqualTo(120)
            make.height.lessThanOrEqualTo(50)
        }
        
        /* 하트 모양 */
        heartStack.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-10)
            
            heart.snp.makeConstraints { make in
                make.height.width.equalTo(20)
            }
            heartCount.snp.makeConstraints { make in
                make.leading.equalTo(heart.snp.trailing).offset(1)
            }
        }
    }
    
    //MARK: - functions
    public func configure(model: Item) {
        addProperty()
        makeConstraints()
        
        self.donutImage.image = model.image
        self.donutName.text = model.name
        self.donutPrice.text = model.price
    }
    
    
    
    
}
