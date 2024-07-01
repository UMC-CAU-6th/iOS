//
//  ViewController.swift
//  Usecode
//
//  Created by 한지강 on 2024/04/07.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 생명주기 메서드 중 하나. 이 메서드는 UIViewController의 view가 메모리에 로드된 직후에 호출된다.
        
        self.view.backgroundColor = .red
        setTitle()
    }
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "연습입니다!!"
        title.textColor = .white
        return title
    }()
    //해당 프로퍼티가 처음으로 접근될 때까지 초기화되지 않는다(필요할 때만 초기화). titlename을 외부에 정의해 다른 메서드나 클래스에서도 쉽게 재사용 가능하다. > 유지보수성 증가
    
    private func setTitle() {
        self.view.addSubview(titleName)
        titleName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleName.leftAnchor.constraint(equalTo: view.leftAnchor)
        ]
        )
    }
    //addsubView란 UIView 클래스의 메서드로 다른 UIview를 현재의 UIView에 서브뷰로 추가하는 역할을 한다.
    //그래서 titlename레이블을 서브뷰로 추가해 화면에 표시한다.
    //NSLayoutConstraint제약조건을 활성화 하는 함수로 제약조건을 포함하는 배열을 전달하여 활성화함.
}

