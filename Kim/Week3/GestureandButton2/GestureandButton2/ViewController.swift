//
//  ViewController.swift
//  GestureandButton2
//
//  Created by 김나연 on 5/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var titleL: UILabel = {
        var t = UILabel()
        t.font = UIFont.systemFont(ofSize: 30)
        t.text = "숙제"
        return t
    }()
    
    //MARK: - d 스와이프
    let imageNames = ["flower1", "flower2", "flower3"]
    private lazy var flower: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageNames[0])
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var pageControl: UIPageControl = {
        var page = UIPageControl()
        page.numberOfPages = imageNames.count
        page.currentPage = 0
        page.pageIndicatorTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        page.currentPageIndicatorTintColor = .white
        page.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        page.addGestureRecognizer(swipeLeft)
        page.addGestureRecognizer(swipeRight)
        page.addTarget(self, action: #selector(changepg(_:)), for: .valueChanged)
        return page
    }()

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
        
        ///d init        view.addSubview(pageControl)
        view.addSubview(flower)
        flower.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(300)
            make.top.equalTo(titleL.snp.bottom).offset(20)
        }
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(titleL.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(210)
            make.width.equalTo(310)
        }
    }

    //MARK: - D Function
    @objc func respondToSwipeGesture(_ gestureRecognizer: UIGestureRecognizer){
        if let swipeGesture = gestureRecognizer as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                if(pageControl.currentPage<pageControl.numberOfPages-1){
                    pageControl.currentPage = pageControl.currentPage+1
                }
                print("swipe left..")
            case UISwipeGestureRecognizer.Direction.right:
                if(pageControl.currentPage>0){
                    pageControl.currentPage = pageControl.currentPage-1
                }
                print("swipe right..")
            default:
                break
            }
        }
    }
    @objc func changepg(_ sender: UIPageControl){
        flower.image = UIImage(named: imageNames[pageControl.currentPage])
    }
}

