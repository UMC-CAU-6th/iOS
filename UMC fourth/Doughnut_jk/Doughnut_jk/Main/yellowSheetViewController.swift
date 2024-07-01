//
//  yellowSheetViewController.swift
//  Doughnut_jk
//
//  Created by 한지강 on 5/8/24.
//

import UIKit

//MARK: - 네비게이션바에 뒤로가기 버튼 추가

class yellowSheetViewController: UIViewController {

    private lazy var backBtn: UIBarButtonItem = {
        let btn = UIButton()
        var configure = UIButton.Configuration.plain()
        let attributeString: [NSAttributedString.Key: Any] = [
            .font: UIFont.NanumGothic(size: 16, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        configure.attributedTitle = AttributedString("뒤로가기", attributes: AttributeContainer(attributeString))
        configure.image = UIImage(systemName: "chevron.compact.backward")
        configure.imagePlacement = .leading
        configure.imagePadding = 5
    
        btn.configuration = configure
        
        btn.addTarget(self, action: #selector(clickedBack), for: .touchUpInside)
        
        
        return UIBarButtonItem(customView: btn)
    }()
    
    
    private func setNavigationBar() {
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    
    
    @objc func clickedBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
