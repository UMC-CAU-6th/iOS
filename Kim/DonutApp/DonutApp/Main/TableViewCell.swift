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
///option 누르고 변수 클릭, command+shift+0
import UIKit

class TableViewCell: UITableViewCell {

    ///cell은 재사용해야함! 그러므로 static을 키워드로 사용
    static let identifier = "tableViewCell"
    
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
    ///Image
    private lazy var donutImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    ///name
    private lazy var donutName: UILabel = {
        let t = UILabel()
        return t
    }()
    ///heart
    private lazy var donutLike = {
        let img = UIImageView()
        let i = UIImage(named: "heart")
        img.image = i
        img.contentMode = .scaleAspectFit
        return img
    }()
    ///heart count
    private lazy var donutLikeCount: UILabel = {
        let t = UILabel()
        t.font = UIFont(name: "Inter", size: 13)
        return t
    }()
    ///price
    private lazy var donutPrice: UILabel = {
        let t = UILabel()
        return t
    }()
    
    //MARK: -스택
    private lazy var middleStackGroup: UIStackView = {
        return commonStackView(spacing: 5)
    }()
    private lazy var likeStackGroup: UIStackView = {
        return commonStackView2(spacing: 3)
    }()
    
    //MARK: - 함수
    ///스택 함수
    private func commonStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }
    private func commonStackView2(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }
    ///스택 뷰에 프로퍼티 추가
    private func addStackProperty() {
        [donutName,donutPrice].forEach {
            self.middleStackGroup.addArrangedSubview($0)
        }
        [donutLike,donutLikeCount].forEach {
            self.likeStackGroup.addArrangedSubview($0)
        }
    }
    ///셀에 프로퍼티 추가
    private func addProperty() {
        [donutImage,middleStackGroup,likeStackGroup].forEach{
            self.addSubview($0)
        }
    }
    ///오토 레이아웃
    private func makeConstraint() {
        donutImage.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(40)
            make.width.lessThanOrEqualTo(70)
            make.height.lessThanOrEqualTo(70)
        }
        middleStackGroup.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-120)
            make.width.greaterThanOrEqualTo(150)
            make.height.lessThanOrEqualTo(35)
        }
        donutLike.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(15)
            make.height.lessThanOrEqualTo(15)
        }
        likeStackGroup.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.height.lessThanOrEqualTo(30)
            make.left.equalToSuperview().offset(295)
        }
    }
    ///모든 프로퍼티 생성
    private func addAllProperty() {
        addStackProperty()
        addProperty()
        makeConstraint()
    }
        
    ///데이터 값 넣기
    public func addData(model: Item) {
        addAllProperty()
        self.donutImage.image = model.img
        updateText(self.donutName, newText: model.name)
        updateText(self.donutPrice, newText: model.price)
        self.donutLikeCount.text = String(model.like)
    }
    
    ///폰트 설정
    private func updateText(_ label: UILabel, newText: String) {
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -5.0,
            .font: UIFont(name: "Inter-ExtraBold", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        let attributedText = NSAttributedString(string: newText, attributes: strokeTextAttributes)
        label.attributedText = attributedText
    }
}
