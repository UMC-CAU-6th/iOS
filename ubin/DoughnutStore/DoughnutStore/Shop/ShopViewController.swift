//
//  ShopViewController.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/1/24.
//

import UIKit
import SnapKit

class ShopViewController: UIViewController {

    // MARK: - Full Screen Scroll
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    //MARK: - 광고 뷰 Stack

    //Title
    private lazy var shopTitle: UILabel = {
        let title = UILabel()
        title.text = "Our Online Store"
        title.textColor = .black
        title.font = UIFont.pretendard(size: 20, weight: .bold)
        
        return title
    }()
    
    //Advertising
    private lazy var adScrollView: UIScrollView = {
        let adScrollView = UIScrollView()
        adScrollView.backgroundColor = .white
        
        return adScrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    ///광고 사진들
    ///for문 쓰기
    private lazy var image1: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "image1")
        image.image = img
        image.contentMode = .scaleAspectFill

        return image
    }()
    
    private lazy var image2: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "image2")
        image.image = img
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var image3: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "image3")
        image.image = img
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var image4: UIImageView = {
        let image = UIImageView()
        let img = UIImage(named: "image4")
        image.image = img
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - Product Stack
    private lazy var productStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    //타이틀 스택(타이틀 + 버튼)
    private lazy var productTitleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    //타이틀
    private lazy var productTitle: UILabel = {
        let title = UILabel()
        title.text = "Products"
        title.textColor = .black
        title.font = UIFont.pretendard(size: 20, weight: .bold)
        
        return title
    }()
    
    //버튼
    private lazy var productButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    //Product Collection View
    var productitem: [productItem] = productItemLists.productitem
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame:.zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isScrollEnabled = false
        view.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    
    //MARK: - ITEMS
    private lazy var itemStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    //타이틀 스택(타이틀 + 버튼)
    private lazy var itemTitleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    //타이틀
    private lazy var itemStackTitle: UILabel = {
        let title = UILabel()
        title.text = "Best Items"
        title.textColor = .black
        title.font = UIFont.pretendard(size: 20, weight: .bold)
        
        return title
    }()
    
    //버튼
    private lazy var itemStackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    //Product Collection View
    var bestitem: [bestItem] = bestItemLists.bestitem
    
    private lazy var bestCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame:.zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isScrollEnabled = false
        view.register(BestItemCollectionViewCell.self, forCellWithReuseIdentifier: BestItemCollectionViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        addStackProperty()
        addProperty()
        makeConstraints()
    }

    //MARK: - 프로퍼티 뷰 추가
    /// 스택에 뷰 추가 함수
    private func addStackProperty() {
        stackView.addArrangedSubview(image1)
        stackView.addArrangedSubview(image2)
        stackView.addArrangedSubview(image3)
        stackView.addArrangedSubview(image4)
        
        productStackView.addArrangedSubview(productTitleStackView)
        productStackView.addArrangedSubview(productCollectionView)
        productTitleStackView.addArrangedSubview(productTitle)
        productTitleStackView.addArrangedSubview(productButton)
        
        itemStackView.addArrangedSubview(itemTitleStackView)

        itemTitleStackView.addArrangedSubview(itemStackTitle)
        itemTitleStackView.addArrangedSubview(itemStackButton)
        
        
    }
    
    /// 프로퍼티 추가 함수
    private func addProperty() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(shopTitle)
        contentView.addSubview(adScrollView)
        adScrollView.addSubview(stackView)
        contentView.addSubview(productStackView)
        contentView.addSubview(itemStackView)
    }

    //MARK: - Constraint
    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height)
        }
    
        shopTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.greaterThanOrEqualTo(50)
            make.leading.equalToSuperview().offset(10)
            make.width.lessThanOrEqualTo(300)
            
        }
        
        adScrollView.snp.makeConstraints { make in
            make.top.equalTo(shopTitle.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(220)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(adScrollView)
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(image4.snp.width).multipliedBy(4)
            make.height.equalTo(adScrollView.snp.height)
        }
        
        image1.snp.makeConstraints { make in
            make.width.equalTo(280)
        }
        
        image2.snp.makeConstraints { make in
            make.width.equalTo(280)
        }
        
        image3.snp.makeConstraints { make in
            make.width.equalTo(280)
        }
        
        image4.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.leading.equalTo(image3.snp.trailing).offset(15)
        }
        
        // Product View
        productStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.top.equalTo(adScrollView.snp.bottom).offset(30)
            
            productTitleStackView.snp.makeConstraints { make in
                make.top.equalTo(productStackView).offset(0)
                make.leading.equalToSuperview().offset(0)
                make.trailing.equalToSuperview().offset(0)
                
                productTitle.snp.makeConstraints { make in
                    make.leading.equalTo(productTitleStackView).offset(10)
                    make.top.equalTo(productTitleStackView).offset(0)
                    make.height.lessThanOrEqualTo(20)

                }
                
                productButton.snp.makeConstraints { make in
                    make.width.height.equalTo(20)
                }
            }
            productCollectionView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(productTitle.snp.bottom).offset(5)
                make.height.greaterThanOrEqualTo(260)
            }
        }
        
        // Best Item View
        itemStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.top.equalTo(productStackView.snp.bottom).offset(30)
            
            itemTitleStackView.snp.makeConstraints { make in
                make.top.equalTo(itemStackView).offset(0)
                make.leading.equalToSuperview().offset(0)
                make.trailing.equalToSuperview().offset(0)
                
                itemStackTitle.snp.makeConstraints { make in
                    make.leading.equalTo(itemTitleStackView).offset(10)
                    make.top.equalTo(itemTitleStackView).offset(0)
                    make.height.lessThanOrEqualTo(20)

                }
                itemStackButton.snp.makeConstraints { make in
                    make.width.height.equalTo(20)
                    make.trailing.equalToSuperview().offset(10)
                }
            }
           
        }
    }
}

//MARK: - Extension
extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productitem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(model: productitem[indexPath.row])
        return cell
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    /// cellSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 2
        let collectionSize = collectionView.frame.size.width - padding * 3
        let itemSize = collectionSize / 4
        return CGSize(width: itemSize, height: itemSize+30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
