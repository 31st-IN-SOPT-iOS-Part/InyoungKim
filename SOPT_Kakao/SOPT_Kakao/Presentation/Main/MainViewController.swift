//
//  MainViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/12.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    //친구 View
    private let friendView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //친구
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    private var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "마이네임이즈"
        return label
    }()
    
    // 설정 버튼
    private lazy var settingButton : UIButton = {
        let settingBtn = UIButton()
        settingBtn.setBackgroundImage(UIImage(named : "settings1"), for: .normal)
        settingBtn.addTarget(self, action: #selector(touchupSettingButton), for: .touchUpInside)
        return settingBtn
    }()
    
    // 프로필 이미지 버튼
    private lazy var profileImageButton : UIButton = {
        let profileImgBtn = UIButton()
        profileImgBtn.setBackgroundImage(UIImage(named: "friendtab_profileImg"), for: .normal)
        profileImgBtn.addTarget(self, action: #selector(touchupProfileImageButton), for: .touchUpInside)
        return profileImgBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getUserInfo()
        setLayout()
    }
    
    //profileDetailVC로 present
    func presentToProfileDetail() {
        let detailVC = ProfileDetailViewController()
        if let name = nameLabel.text {
            detailVC.dataBind(name: name)
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    // UserDefaults애 있는 정보를 받아옴
    func getUserInfo() {
        if nameLabel.text != nil {
            nameLabel.text = UserDefaults.standard.string(forKey: "userName")
        }
        else {
            print("이름이 없군요!")
        }
    }
    
    //settingButton
    @objc
    func touchupSettingButton() {
        print("setting")
    }
    
    //profileImageButton
    @objc
    func touchupProfileImageButton(){
        presentToProfileDetail()
    }
}

extension MainViewController {
    
    func setLayout() {
        
        // 친구, 설정버튼을 friendView에 추가
        friendView.addSubview(friendLabel)
        friendView.addSubview(settingButton)
        
        view.addSubViews(friendView, profileImageButton, nameLabel)
        
        friendView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.friendView.snp.centerY)
            make.leading.equalTo(self.friendView.snp.leading).offset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.friendView.snp.centerY)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            make.height.width.equalTo(21)
        }
        
        profileImageButton.snp.makeConstraints { make in
            make.top.equalTo(self.friendView.snp.bottom).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.height.width.equalTo(59)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.profileImageButton.snp.centerY)
            make.leading.equalTo(self.profileImageButton.snp.trailing).offset(10)
        }
    }
}
