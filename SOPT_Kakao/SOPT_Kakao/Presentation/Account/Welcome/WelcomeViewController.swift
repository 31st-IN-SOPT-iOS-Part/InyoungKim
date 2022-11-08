//
//  WelcomeViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/09.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    //OOO님 환영합니다
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "누구신지?"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    //확인 버튼
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    func dataBind(name: String) {
        nameLabel.text = "\(name) 님\n 환영합니다"
        setUserInfo(name: name)
    }
    
    //RootVC를 변경하는 함수
    func pushToMainVC() {
        let rootVC = KakaoTabbarController()
        changeRootViewController(rootVC)
    }
    
    //UserDefaults에 UserName을 담는다
    func setUserInfo(name: String) {
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    @objc
    private func touchupBackButton() {
        pushToMainVC()
    }
    
}

extension WelcomeViewController {
    
    func setLayout() {
        view.addSubViews(nameLabel, backButton)
        
        //OO님 환영합니다!
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        //확인버튼
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(117)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
    }
}
