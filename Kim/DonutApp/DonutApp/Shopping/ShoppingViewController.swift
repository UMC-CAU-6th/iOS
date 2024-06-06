//
//  ShoppingViewController.swift
//  DonutApp
//
//  Created by 김나연 on 5/9/24.
//

import UIKit
import SnapKit
//TODO: - 다시 공부하기..(처음부터 다시 만들어볼것!!)
//오바라이딩 오버로딩 개념 공부
//중복되는 거 재사용하는 법 공부
class ShoppingViewController: UIViewController {
    let adData = ShopItem.adDataList
    let apData = ShopItem.apDataList
    let biData = ShopItem.biDataList
    
    //MARK: - UI
    ///label
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -1.0,
            .font: UIFont(name: "Inter-ExtraBold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
        ]
        title.attributedText = NSAttributedString(string: "Donut Online Store", attributes: strokeTextAttributes)
        return title
    }()
    private lazy var title2Label: UILabel = {
        let title = UILabel()
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .strokeWidth: -1.0,
            .font: UIFont(name: "Inter-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        title.attributedText = NSAttributedString(string: "All Products", attributes: strokeTextAttributes)
        return title
    }()
    private lazy var title3Label: UILabel = {
        let title = UILabel()
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .strokeWidth: -1.0,
            .font: UIFont(name: "Inter-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        title.attributedText = NSAttributedString(string: "Best Items", attributes: strokeTextAttributes)
        return title
    }()
    ///scrollview
    private lazy var mainScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.delegate = self
        sv.isScrollEnabled = true
        sv.showsVerticalScrollIndicator = true
        sv.showsHorizontalScrollIndicator = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    ///content
    private lazy var contentView: UIView = {
        let v = UIView()
        return v
    }()
    //MARK: - Collection View
    ///광고
    private lazy var adView: UICollectionView = {
        let lo = UICollectionViewFlowLayout()
        lo.scrollDirection = .horizontal
        lo.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lo)
        cv.dataSource = self
        cv.delegate = self
        cv.register(AdCollectionViewCell.self, forCellWithReuseIdentifier: AdCollectionViewCell.identifier)
        cv.tag = 1
        return cv
    }()
    ///all product
    private lazy var apView: UICollectionView = {
        let lo = UICollectionViewFlowLayout()
        lo.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lo)
        cv.dataSource = self
        cv.delegate = self
        cv.register(AllProductCell.self, forCellWithReuseIdentifier: AllProductCell.identifier)
        cv.tag = 2
        return cv
    }()
    ///best items
    private lazy var biView: UICollectionView = {
        let lo = UICollectionViewFlowLayout()
        lo.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lo)
        cv.dataSource = self
        cv.delegate = self
        cv.register(BestItemCell.self, forCellWithReuseIdentifier: BestItemCell.identifier)
        cv.tag = 3
        return cv
    }()
    //MARK: - Stack
    private func createStackView() -> UIStackView {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 10
        return s
    }
    private lazy var apStack: UIStackView = {
        return createStackView()
    }()
    private lazy var biStack: UIStackView = {
        return createStackView()
    }()
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(contentView)
        scrollMakeConstraints()
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(adView)
        self.contentView.addSubview(apStack)
        self.contentView.addSubview(biStack)
        apStack.addArrangedSubview(title2Label)
        apStack.addArrangedSubview(apView)
        biStack.addArrangedSubview(title3Label)
        biStack.addArrangedSubview(biView)
        contentMakeConstraints()
        
    }
    //MARK: - Snapkit
    private func scrollMakeConstraints(){
        mainScrollView.snp.makeConstraints{ make in
            //make.edges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        contentView.snp.makeConstraints{ make in
            make.edges.equalTo(mainScrollView)
            make.width.equalTo(mainScrollView)
            make.height.equalTo(1500)
            //make.height.greaterThanOrEqualToSuperview()
        }
    }
    private func contentMakeConstraints(){
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.greaterThanOrEqualTo(100)
            make.height.greaterThanOrEqualTo(20)
        }
        adView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(0)
            make.width.equalToSuperview()
            make.height.lessThanOrEqualTo(200)
        }
        apStack.snp.makeConstraints{ make in
            make.top.equalTo(adView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(310)
        }
        biStack.snp.makeConstraints{ make in
            make.top.equalTo(apStack.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(1000)
        }
    }
}
//MARK: - Extension
//스크롤 하면 타이틀 보임
extension ShoppingViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        self.navigationItem.title = offsetY>0 ? "Donut Online Store" : ""
    }
}
extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        switch collectionView.tag {
        case 1:
            return adData.count
        case 2:
            return apData.count
        case 3:
            return biData.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifier, for: indexPath) as? AdCollectionViewCell else {return UICollectionViewCell()}
            cell.configure(model: adData[indexPath.item], radius: 10)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllProductCell.identifier, for: indexPath) as? AllProductCell else {return UICollectionViewCell()}
            cell.configure(model: apData[indexPath.item], radius: 40)
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestItemCell.identifier, for: indexPath) as? BestItemCell else {return UICollectionViewCell()}
            cell.configure(model: biData[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            let ad = adData[indexPath.item]
            let height = collectionView.bounds.height
            let aspectRatio = (ad.img?.size.width ?? 1)/(ad.img?.size.height ?? 1)
            return CGSize(width: height*aspectRatio, height: height)
        case 2:
            return imageCGSize(collectionView, row: 4, spacing: 10, height: 100)
        case 3:
            return imageCGSize(collectionView, row: 2, spacing: 10, height: 200)
        default:
            return CGSize(width: 0, height: 0)
        }
        func imageCGSize(_ collectionView: UICollectionView, row: CGFloat, spacing: CGFloat, height: CGFloat) -> CGSize {
            let numberOfItemsPerRow: CGFloat = row
            let spacingBetweenItems: CGFloat = spacing
            let totalSpacing = (2 * spacingBetweenItems) + ((numberOfItemsPerRow - 1) * spacingBetweenItems)
            let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
            let height: CGFloat = height
            return CGSize(width: width, height: height)
        }
    }
}
