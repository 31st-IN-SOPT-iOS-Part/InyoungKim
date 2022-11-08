//
//  ProfileDetailViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/13.
//

import UIKit
import SnapKit

class ProfileDetailViewController: UIViewController {
    
    //이름 (ex.김솝트)
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "내 이름"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    //프로필이미지
    private lazy var profileImageButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "friendtab_profileImg"), for: .normal)
        return button
    }()
    
    //나와의 채팅버튼
    private lazy var profileTalkButton : UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.subtitle = "나와의 채팅"
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        button.configuration?.image = UIImage(named: "profileTalkImg")
        button.configuration?.imagePadding = 8
        button.configuration?.imagePlacement = NSDirectionalRectEdge.top
        button.configuration?.baseBackgroundColor = .clear
        return button
    }()
    
    //프로필 편집버튼
    private lazy var profileEditButton : UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.subtitle = "프로필 편집"
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        button.configuration?.image = UIImage(named: "profile_editImg")
        button.configuration?.imagePadding = 8
        button.configuration?.imagePlacement = NSDirectionalRectEdge.top
        button.configuration?.baseBackgroundColor = .clear
        return button
    }()
    
    //카카오 스토리버튼
    private lazy var profileStoryButton : UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.subtitle = "카카오스토리"
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        button.configuration?.image = UIImage(named: "profileStoryImg")
        button.configuration?.imagePadding = 8
        button.configuration?.imagePlacement = NSDirectionalRectEdge.top
        button.configuration?.baseBackgroundColor = .clear
        return button
    }()
    
    //이전 버튼
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()
       
    //lineView
    private let underlineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setLayout()
    }
    
    func dataBind(profile: FriendModel) {
        nameLabel.text = "\(profile.name)"
        profileImageButton.setBackgroundImage(UIImage(named: "\(profile.profileImage)"), for: .normal)
    }
    
    @objc
    func tapBackButton() {
        self.dismiss(animated: true)
    }
}

extension ProfileDetailViewController {
    
    func setLayout() {
        
        view.addSubViews(profileTalkButton, profileImageButton, profileStoryButton, profileEditButton, nameLabel, underlineView, backButton)
        
        //프로필이미지
        profileImageButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            make.centerX.equalToSuperview()
        }
        
        //이름
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.profileImageButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        //underline
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(42)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        //나와의 채팅 버튼
        profileTalkButton.snp.makeConstraints { make in
            make.top.equalTo(self.underlineView.snp.bottom).offset(12)
            make.trailing.equalTo(profileEditButton.snp.leading)
            make.height.equalTo(72)
            make.width.equalTo(92.67)
        }
        
        //프로필 편집 버튼
        profileEditButton.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(72)
            make.width.equalTo(92.67)
        }
        
        // 카카오스토리 버튼
        profileStoryButton.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(12)
            make.leading.equalTo(profileEditButton.snp.trailing)
            make.height.equalTo(72)
            make.width.equalTo(92.67)
        }
        
        //back 버튼
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.height.equalTo(14)
        }
    }
}
