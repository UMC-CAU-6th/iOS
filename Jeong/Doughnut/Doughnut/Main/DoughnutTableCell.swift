//
//  DoughnutTableCell.swift
//  Doughnut
//
//  Created by 정의찬 on 5/2/24.
//

import UIKit
import SnapKit

class DoughnutTableCell: UITableViewCell {
    
    // MARK: - Static
    static let identifier = "doughnetTableCell"
    
    // MARK: - Init

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
    
    
    // MARK: - CellProeprty
    
    /// 도넛 사진 출력 프로퍼티
    private lazy var doughnutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0.3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    /// 도넛 이름 출력 프로퍼티
    private lazy var doughnutName: UILabel = {
        return commonText(size: 18, weight: .bold)
    }()
    
    /// 도넛 가격 출력 프로퍼티
    private lazy var doughnutPrice: UILabel = {
        return commonText(size: 14, weight: .medium)
    }()
    
    /// 도넛 좋아요 출력 프로퍼티
    private lazy var doughnutLikeCount: UILabel = {
        return commonText(size: 10, weight: .regular)
    }()
    
    /// 도넛 댓글 출력 프로퍼티
    private lazy var doughnutCommentCount: UILabel = {
        return commonText(size: 10, weight: .regular)
    }()
    
    /// 도넛 좋아요 이미지 출력 프로퍼티
    private lazy var doughnutLikeImage: UIImageView = {
        return commonImageView(name: "heart", color: .red)
    }()
    
    /// 도넛 댓글 카운트 출력 프로퍼티
    private lazy var doughnutCommentImage: UIImageView = {
        return commonImageView(name: "message", color: .blue)
    }()
    
    // MARK: - Stack
    
    /// 바텀 스택 그룹 모음
    private lazy var bottomStackGroup: UIStackView = {
        return commonStackView(spacing: 10)
    }()
    
    /// 도넛 좋아요 스택
    private lazy var doughnutLikeStack: UIStackView = {
        return commonStackView(spacing: 3)
    }()
    
    /// 도넛 댓글 스택
    private lazy var doughnutCommentStack: UIStackView = {
        return commonStackView(spacing: 3)
    }()
    
    // MARK: - Function
    
    
    /// 텍스트 공통 부분 리턴하는 함수 작성
    /// - Parameters:
    ///   - size: 원하는 텍스트의 크기 지정
    ///   - weight: 원하는 텍스트의 볼드 지정
    /// - Returns: 파라미터로 지정한 텍스트 생성
    private func commonText(size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let text = UILabel()
        text.font = UIFont.pretendard(size: size, weight: weight)
        text.textAlignment = .center
        text.textColor = UIColor.black
        return text
    }
    
    /// 이미지 공통 부분 리턴하는 함수 작성
    /// - Parameter name: 사용하고자 하는 이미지 입력
    /// - Returns: 지정된 속성으로 이미지 반환
    private func commonImageView(name: String, color: UIColor) -> UIImageView {
        let imageView = UIImageView()
        let img = UIImage(systemName: name)?.withTintColor(color, renderingMode: .alwaysOriginal)
        imageView.image = img
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    /// 스택 공통 부분 리턴하는 함수 작성
    /// - Parameter spacing: 스택 내부 공간 조정
    /// - Returns: 스택 리턴
    private func commonStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }
    
    // MARK: - Constraints
    
    /// 스택뷰에 프로퍼티 추가 후 스택 뷰 추가
    private func addStackSubProperty() {
        
        [doughnutLikeImage, doughnutLikeCount].forEach {
            self.doughnutLikeStack.addArrangedSubview($0)
        }
        
        [doughnutCommentImage, doughnutCommentCount].forEach {
            self.doughnutCommentStack.addArrangedSubview($0)
        }
        
        [doughnutLikeStack, doughnutCommentStack].forEach {
            self.bottomStackGroup.addArrangedSubview($0)
        }
    }
    
    /// 셀에 들어갈 프로퍼티 추가
    private func addProperty() {
        [doughnutImage, doughnutName, doughnutPrice, bottomStackGroup].forEach {
            self.addSubview($0)
        }
    }
    
    /// 오토레이아웃 적용
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
        
        doughnutPrice.snp.makeConstraints{ make in
            make.leading.equalTo(doughnutImage.snp.trailing).offset(14)
            make.top.equalTo(doughnutName.snp.bottom).offset(10)
            make.width.greaterThanOrEqualTo(99)
            make.height.lessThanOrEqualTo(22)
        }
        
        bottomStackGroup.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-9)
            make.right.equalToSuperview().offset(-15)
            make.width.lessThanOrEqualTo(180)
            make.height.lessThanOrEqualTo(30)
        }
    }
    
    /// 모든 프로퍼티 생성
    private func allAllProperty() {
        addStackSubProperty()
        addProperty()
        makeConstrains()
    }
    
    /// 셀에 대한 데이터 값을 넣기 위한 함수
    /// - Parameter model: 데이터를 저장하는 Item 타입
    public func configureCell(model: Item) {
        
        allAllProperty()
        
        self.doughnutImage.image = model.img
        self.doughnutName.text = model.name
        self.doughnutPrice.text = model.price
        self.doughnutLikeCount.text = String(model.like)
        self.doughnutCommentCount.text = String(model.comment)
    }
}
