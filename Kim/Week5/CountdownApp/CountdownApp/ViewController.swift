//
//  ViewController.swift
//  CountdownApp
//
//  Created by 김나연 on 5/21/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - UI label
    private lazy var countdownTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "100 : 100"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    //MARK: - Button
    private lazy var startBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("START", for: .normal)
        btn.setTitleColor(UIColor.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
        return btn
    }()
    private var counter1 = 100
    private var timer1:Timer?
    private var counter2 = 100
    private var timer2:Timer?
    
    //MARK: -Segmented control
    private lazy var customView1: CustomView = {
        let cv = CustomView(bgColor: .orange)
        cv.setConstraints()
        return cv
    }()
    private lazy var customView2: CustomView = {
        let cv = CustomView(bgColor: .red)
        cv.setConstraints()
        return cv
    }()
    ///segmented control
    private lazy var segmentedCon: UISegmentedControl = {
        let items = ["Timer","Orange","Red"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(scChange), for: .valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customView1.isHidden = true
        customView2.isHidden = true
        ///add view
        view.addSubview(segmentedCon)
        view.addSubview(countdownTitleLabel)
        view.addSubview(startBtn)
        view.addSubview(customView1)
        view.addSubview(customView2)
        ///snapkit
        segmentedCon.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(90)
            make.centerX.equalToSuperview()
        }
        countdownTitleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(280)
            make.centerX.equalToSuperview()
        }
        startBtn.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(380)
            make.centerX.equalToSuperview()
        }
        customView1.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(630)
            make.width.equalTo(310)
            make.centerX.equalToSuperview()
        }
        customView2.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(630)
            make.width.equalTo(310)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Function
    @objc private func clickedBtn(){
        updateLabel()
        timer1?.invalidate()
        timer1?.invalidate()
        timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(decreaseCount1), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(decreaseCount2), userInfo: nil, repeats: true)
        
    }
    //global dispatch queue를 만들것
    @objc private func decreaseCount1(){
        if counter1 > 0 {
            counter1 -= 1
            DispatchQueue.main.async { [weak self] in
                self?.updateLabel()
            }
        } else {
            timer1?.invalidate()
        }
    }
    @objc private func decreaseCount2(){
        if counter2 > 0 {
            counter2 -= 1
            DispatchQueue.main.async { [weak self] in
                self?.updateLabel()
            }
        } else {
            timer2?.invalidate()
        }
    }
    private func updateLabel(){
        countdownTitleLabel.text = "\(counter1) : \(counter2)"
    }
    @objc private func scChange(_ sender: UISegmentedControl){
        customView1.isHidden = true
        customView2.isHidden = true
        countdownTitleLabel.isHidden = true
        startBtn.isHidden = true
        switch segmentedCon.selectedSegmentIndex{
        case 0:
            countdownTitleLabel.isHidden = false
            startBtn.isHidden = false
        case 1:
            customView1.isHidden = false
        case 2:
            customView2.isHidden = false
        default:
            break
        }
    }
}

