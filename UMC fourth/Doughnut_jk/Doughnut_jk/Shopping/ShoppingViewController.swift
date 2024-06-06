//
//  ShoppingViewController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/8/24.
//
import UIKit
import SnapKit

class ShoppingViewController: UIViewController {
    
    let adverData = AdverDataClass.dataLists
    let productData = AdverDataClass.allLists
    let bestItem = AdverDataClass.bestLists
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Doughnut Online Store"
        scrollMakeConstraints()
        contentsMakeConstraints()
    }
    
    // MARK: - 프로퍼티
    private lazy var titleHeader: UILabel = {
        return makeUILabel("Doughnut Online Store", size: 23, weight: .bold)
    }()
    
    private lazy var allProductsLabel: UILabel = {
        return makeUILabel("All Products", size: 20, weight: .semibold)
    }()
    
    private lazy var bestItemsLabel: UILabel = {
        return makeUILabel("Best Items", size: 20, weight: .semibold)
    }()
    
    private lazy var allProductsButton: UIButton = {
        return makeUIButton()
    }()
    
    private lazy var bestItemsButton: UIButton = {
        return makeUIButton()
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - 콜렉션뷰 설정
    
    private lazy var advertisementCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 15
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.identifier)
        collection.tag = 1
        
        return collection
    }()
    
    private lazy var supplyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(AllCollectionViewCell.self, forCellWithReuseIdentifier: AllCollectionViewCell.identifier)
        collection.tag = 2
        
        return collection
    }()
    
    private lazy var bestItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(BestItemCell.self, forCellWithReuseIdentifier: BestItemCell.identifier)
        collection.tag = 3
        
        return collection
    }()
    
    // MARK: - 타이틀과 버튼 스택뷰에 넣기
    
    private lazy var allProductsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [allProductsLabel, allProductsButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var bestItemsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bestItemsLabel, bestItemsButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - 오토 레이아웃
    
    private func makeUILabel(_ text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    private func makeUIButton() -> UIButton {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return button
    }
    
    private func scrollAddComponent() {
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(contentsView)
    }
    
    private func contentsAddComponent() {
        self.contentsView.addSubview(titleHeader)
        self.contentsView.addSubview(advertisementCollectionView)
        self.contentsView.addSubview(allProductsStackView)
        self.contentsView.addSubview(supplyCollectionView)
        self.contentsView.addSubview(bestItemsStackView)
        self.contentsView.addSubview(bestItemCollectionView)
        self.contentsView.addSubview(pageControl)
    }
    
    private func scrollMakeConstraints() {
        scrollAddComponent()
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentsView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView)
            make.width.equalTo(mainScrollView)
            make.height.equalTo(1150)
        }
    }
    
    private func contentsMakeConstraints() {
        contentsAddComponent()
        
        titleHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.greaterThanOrEqualTo(100)
            make.height.equalTo(30)
        }
        
        advertisementCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleHeader.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(0)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        allProductsStackView.snp.makeConstraints { make in
            make.top.equalTo(advertisementCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        supplyCollectionView.snp.makeConstraints { make in
            make.top.equalTo(allProductsStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(300)
        }
        
        bestItemsStackView.snp.makeConstraints { make in
            make.top.equalTo(supplyCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        bestItemCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bestItemsStackView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(300)
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(bestItemCollectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}

// MARK: - Extension

extension ShoppingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        self.navigationController?.navigationBar.topItem?.title = offsetY > 50 ? "Doughnut Online Store" : ""
    }
}

extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return adverData.count
        case 2:
            return productData.count
        case 3:
            return bestItem.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.identifier, for: indexPath) as? AdvertisementCell else { return UICollectionViewCell() }
            
            cell.configure(model: adverData[indexPath.item], radius: 10)
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllCollectionViewCell.identifier, for: indexPath) as? AllCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure(model: productData[indexPath.item], radius: 40)
            
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestItemCell.identifier, for: indexPath) as? BestItemCell else { return UICollectionViewCell() }
            
            cell.configure(model: bestItem[indexPath.item])
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 300, height: 200)
        case 2:
            let width = (collectionView.frame.width - 50) / 4 // 4열
            let height = (collectionView.frame.height - 50) / 2 // 2행
            return CGSize(width: width, height: height)
        case 3:
            let width = (collectionView.frame.width - 40) / 2 // 2열
            let height = (collectionView.frame.height - 40) / 2 // 2행
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == bestItemCollectionView {
            let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = Int(pageIndex)
        }
    }
}
