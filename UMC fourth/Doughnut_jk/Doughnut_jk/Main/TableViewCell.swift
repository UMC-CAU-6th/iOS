//
//  TableViewCell.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/8/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    static let identifier = "doughnetTableCell"
    
    
    
    
    //MARK: - 셀 프로퍼티
    
    
    
    private lazy var doughnutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0.3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        return imageView
    }()
    
    private func commonText(size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let text = UILabel()
        text.font = UIFont.NanumGothic(size: size, weight: weight)
        text.textAlignment = .center
        text.textColor = UIColor.black
        return text
    }
    
    private lazy var doughnutName: UILabel = {
        return commonText(size: 18, weight: .bold)
    }()
    
    private lazy var doughnutprice: UILabel = {
        return commonText(size: 14, weight: .regular)
    }()
    
    
    private func addProperty() {
        [doughnutImage, doughnutName, doughnutprice].forEach{self.addSubview($0)}
    }
    
    private func makeConstrains() {
        doughnutImage.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(20)
            make.width.lessThanOrEqualTo(100)
            make.height.lessThanOrEqualTo(100)
        }
        
        doughnutName.snp.makeConstraints{ make in
            make.leading.equalTo(doughnutImage.snp.trailing).offset(14)
            make.top.equalToSuperview().offset(30)
            make.width.greaterThanOrEqualTo(99)
            make.height.lessThanOrEqualTo(24)
        }
        
        
        doughnutprice.snp.makeConstraints{ make in
            make.leading.equalTo(doughnutImage.snp.trailing).offset(14)
            make.top.equalTo(doughnutName.snp.bottom).offset(10)
            make.width.greaterThanOrEqualTo(99)
            make.height.lessThanOrEqualTo(22)
        }
    }
    
    
    private func allAllProperty() {
        addProperty()
        makeConstrains()
    }
    
    
    public func configureCell(model: Item) {
        
        allAllProperty()
        
        self.doughnutImage.image = model.img
        self.doughnutName.text = model.name
        self.doughnutprice.text = model.price
    }


    //MARK: - 초기화
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
        fatalError()
    }
}
