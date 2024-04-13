//
//  ViewController.swift
//
//  Created by 황유빈 on 4/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        setTitle()
    }
    // viewDidLoad()란 뭘까?
    /* Answer
     - UIViewController 의 method로 메모리에 view controller 가 올라오면 가장 먼저 실행
     - 주로 추가적인 초기화 작업을 구현하기 위해 오버라이딩 되어 사용
     - view가 메모리에 올라온 후 호출된다.
     - 뷰가 메모리에 올라온 후, 한 번만 호출된다.
     - 뷰가 메모리에서 해제되었다면 viewDIdLoad()는 다시 호출된다.
     - view가 메모리에 올라올 때 한 번만 실행되므로, 처음 한 번만 실행하면 되는 코드를 이곳에 작성
     */
    // willAppear willDisAppear, DidDisAppear도 공부
    /* Answer
     - willAppear
        - view가 화면에 나타나기 전에 호출된다.
        - ViewController가 메모리에 올라올 때, 한 번만 실행되는 viewDIdLoad()와 다르게 화면을 띄워줄 때마다 호출된다.
        - 뷰를 띄울 때마다 특정 처리가 필요하거나, 다른 뷰에서 처리한 작업 결과로 인해 뷰를 업데이트해야 하는 경우에 사용(화면 갱신이 필요한 상황)
     - willDisappear
        - 스크린에서 뷰가 사라지기 전에 호출된다.
        - 진행 중인 애니메이션을 멈추거나, 타이머를 종료시키는 등의 작업을 처리한다.
     - DidDisAppear
        - 스크린에서 뷰가 사라진 후 호출된다.
        - 단지 화면이 스크린에서 내려갔을 뿐, 메모리에서 해제된 것은 아니다.
     */
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "연습입니다!!"
        title.textColor = .white
        return title
    }()
    // UILabele을 부르는데 왜 ViewDidLoad에 작성하지 않고, 바깥에 프로퍼티를 정의하고 lazy 키워드를 붙였을까??
    /* Answer
     UILabel을 viewdidLoad 바깥에 프로퍼티로 정의하고 lazy 키워드를 사용하는 것은 해당 라벨이 처음으로 액세스될 때까지 해당 라벨이 생성되는 것을 지연시킴
     이는 라벨이 실제로 필요할 때까지 생성되지 않으므로, 라벨이 항상 사용되지 않거나 생성이 자원 집약적인 경우 리소스를 절약할 수 있음
     이것은 라벨을 만드는 데 시간이 걸리거나 라벨이 뷰 컨트롤러가 로드될 때 즉시 필요하지 않은 경우 성능 최적화에 유용
     */
    
    private func setTitle() {
        self.view.addSubview(titleName)
        // 정의한 프로퍼티를 self.view.addSubview()에 정의했다. addSubView 메소드가 무엇이고, 왜 이렇게 사용했을까?
        /* Answer
         - addSubView() : UIView 클래스의 메서드로서, 다른 뷰를 해당 뷰의 하위 뷰로 추가하는 데 사용(해당 뷰의 서브뷰로 다른 뷰를 넣는 것)
         - self.view.addSubview(titleName)은 titleName이라는 뷰를 현재 뷰 컨트롤러의 루트 뷰에 서브뷰로 추가하는 것
         */
        titleName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        )
        // 위 코드는 무엇을 의미하는 걸까?
        /* Answer
        이 코드는 Auto Layout을 사용하여 화면의 제목을 가운데 정렬하는 것을 나타냄
        NSLayoutConstraint클래스를 사용하여 제목 뷰의 centerXAnchor(수평 중심선)를 화면의 centerXAnchor와 일치시키고
        centerYAnchor(수직 중심선)를 화면의 centerYAnchor와 일치시킴
        */
        // NSLayoutConstraint란
        /* 제약 기반의 레이아웃 시스템에서 충족해야하는 두 인터페이스 개체 간의 관계
         NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
         - item: 제약을 지정할 UI
         - attribute: 제약을 지정할 UI의 제약 속성
         - relatedBy: 제약을 지정할 UI와 제약의 기준이 되는 UI 사이의 관계
         - toItem: 제약의 기준이 되는 UI
         - attribute: 제약의 기준이 되는 UI의 제약 속성
         - multiplier: 제약의 비율
         - constraint: 제약의 상수값
         */
    }
}

