//
//  ShoppingViewController.swift
//  Doughnut
//
//  Created by 정의찬 on 5/2/24.
//

import UIKit
import SnapKit

class ShoppingViewController: UIViewController {
    
    let adverData = AdverDataClass.dataLists
    let productData = AdverDataClass.productList
    let bestItem = AdverDataClass.bestItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        scrollMakeConstraints()
        contentsMakeContraints()
    }
    
    // MARK: - Property
    
    private lazy var titleHeader: UILabel = {
        return makeUILabel("Doughnut Online Store", size: 21, weight: .bold)
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
    
    // MARK: - CollectionView
    
    private lazy var advertisementCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.identifier)
        collection.tag = 1
        
        return collection
    }()
    
    private lazy var supplyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(BestProductCell.self, forCellWithReuseIdentifier: BestProductCell.identifier)
        collection.tag = 2
        
        return collection
    }()
    
    private lazy var bestItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(BestItemCell.self, forCellWithReuseIdentifier: BestItemCell.identifier)
        collection.tag = 3
        
        return collection
    }()
    
    // MARK: - Funtion
    
    private func makeUILabel(_ text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.pretendard(size: size, weight: weight)
        label.textColor = UIColor.black
        
        return label
    }
    
    private func scrollAddComponent() {
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(contentsView)
    }
    
    private func contentsAddComponent() {
        self.contentsView.addSubview(titleHeader)
        self.contentsView.addSubview(advertisementCollectionView)
        self.contentsView.addSubview(supplyCollectionView)
        self.contentsView.addSubview(bestItemCollectionView)
    }
    
    
    private func scrollMakeConstraints() {
        
        scrollAddComponent()
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentsView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView)
            make.width.equalTo(mainScrollView)
            make.height.greaterThanOrEqualToSuperview()
        }
    }
    
    private func contentsMakeContraints() {
        contentsAddComponent()
        
        titleHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.greaterThanOrEqualTo(100)
            make.height.greaterThanOrEqualTo(20)
        }
        
        advertisementCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(titleHeader.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(0)
            make.width.equalToSuperview()
            make.height.lessThanOrEqualTo(200)
        }
        
        supplyCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(advertisementCollectionView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.lessThanOrEqualTo(280)
        }
        
        bestItemCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(supplyCollectionView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(1000)
        }
    }
}

// MARK: - Extension

extension ShoppingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        self.navigationItem.title = offsetY > 0 ? "Doughnut Online Store" : ""
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestProductCell.identifier, for: indexPath) as? BestProductCell else { return UICollectionViewCell() }
            
            cell.configure(model: productData[indexPath.item], radius: 40)
            
            
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestItemCell.identifier, for: indexPath) as? BestItemCell else { return BestItemCell() }
            
            cell.configure(model: bestItem[indexPath.item])
            
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
            let advertisement = adverData[indexPath.item]
            let height = collectionView.bounds.height
            let aspectRatio = (advertisement.imageName?.size.width ?? 1) / (advertisement.imageName?.size.height ?? 1)
            
            return CGSize(width: height * aspectRatio, height: height)
        case 2:
            return imageCGSize(collectionView, row: 4, spacing: 10, height: 100)
            
        case 3:
            return imageCGSize(collectionView, row: 2, spacing: 10, height: 200)
            
        default:
            return CGSize(width: 0, height: 0)
        }
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
