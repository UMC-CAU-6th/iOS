//
//  ViewController.swift
//  BackGroundColor
//
//  
//

import UIKit

class ViewController: UIViewController {

    //인스턴스가 메모리에 로드된 직후에 호출되는 초기화 단계
    //viewWillAppear : 해당 뷰 컨트롤러의 뷰가 화면에 나타나기 직전에 호출
    //데이터를 업데이트하거나 뷰를 리로드하
    //viewWillDisappear : 해당 뷰 컨트롤러의 뷰가 화면에서 사라지기 직전에 호출
    //화면이 사라지기 전에 필요한 작업을 수행, 사용자 입력을 저장하거나 작업을 종료함
    //viewDidDisappear : 해당 뷰 컨트롤러의 뷰가 화면에서 완전히 사라진 후에 호출
    //화면이 사라진 후 추가적인 정리 작업을 수행, 리소스를 해제하거나 상태를 초기화
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        setTitle()
    }
    //초기화를 지연시키기 위해 lazy 키워드 사용, 필요한 시점에 초기화 가능
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "연습!!"
        title.textColor = .white
        return title
    }()
    
    private func setTitle(){
        //addSubview : 하위 뷰 목록 끝에 뷰를 추가
        //self.viewd의 하위 뷰로 추가
        self.view.addSubview(titleName)
        titleName.translatesAutoresizingMaskIntoConstraints = false
        //여백
        let leftPadding: CGFloat = 10.0
        NSLayoutConstraint.activate([
            //Auto Layout을 사용하여 titleName 레이블을 화면의 중앙에 위치시킴
            /*Anchor 종류
             topAnchor : 위
             bottomAnchor : 아래
             leadingAnchor : 왼쪽
             trailingAnchor : 오른쪽
             centerXAnchor : 중앙 X
             centerYAnchor : 중앙 Y
             leftAnchor : 왼쪽
             rightAnchor :
             */
            titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPadding),
            titleName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

