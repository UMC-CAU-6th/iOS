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
    }
    
    
    private func scrollMakeConstraints() {
        
        scrollAddComponent()
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentsView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView)
            make.width.equalTo(mainScrollView)
            make.height.equalToSuperview()
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
        return adverData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.identifier, for: indexPath) as? AdvertisementCell else { return UICollectionViewCell() }
        
        cell.configure(model: adverData[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let advertisement = adverData[indexPath.item]
        let height = collectionView.bounds.height
        let width = advertisement.imageName?.size.width // Default width if image size is not available
        let aspectRatio = (advertisement.imageName?.size.width ?? 1) / (advertisement.imageName?.size.height ?? 1)
        
        return CGSize(width: height * aspectRatio, height: height)
    }
}
