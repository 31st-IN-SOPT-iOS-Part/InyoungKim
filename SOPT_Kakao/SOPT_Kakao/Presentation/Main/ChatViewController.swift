//
//  ChatViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/26.
//

import UIKit

class ChatViewController: UIViewController {

    //MARK: -  UI Components
    
    
    //MARK: - ChatCollectionView
    private lazy var chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }

    var chatList : [ChatModel] = [
        ChatModel(name: "안솝트", profileImage: "profileImage1", message: "언제 볼건데??"),
        ChatModel(name: "최솝트", profileImage: "profileImage2", message: "피곤해요"),
        ChatModel(name: "정솝트", profileImage: "profileImage3", message: "아요 짱"),
        ChatModel(name: "강솝트", profileImage: "profileImage4", message: "솝트 짱"),
        ChatModel(name: "오솝트", profileImage: "profileImage5", message: "유대"),
        ChatModel(name: "황솝트", profileImage: "profileImage6", message: "몰입"),
        ChatModel(name: "최솝트", profileImage: "profileImage7", message: "도전"),
        ChatModel(name: "고솝트", profileImage: "profileImage8", message: "하암"),
        ChatModel(name: "하솝트", profileImage: "profileImage9", message: "공부시로링"),
    ]
    
    //MARK: - 상단 바
    private let topBarView = UIView()
    // 채팅 라벨
    private let chatLabel = UILabel().then {
        $0.text = "친구"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    //오픈채팅 라벨
    private let openChatLabel = UILabel().then {
        $0.text = "오픈채팅"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    //add 버튼
    private lazy var addButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "iconPlus"), for: .normal)
        button.addTarget(self, action: #selector(touchupAddButton), for: .touchUpInside)
        return button
    }()
    // 설정 버튼
    private lazy var settingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named : "settings1"), for: .normal)
        $0.addTarget(self, action: #selector(touchupSettingButton), for: .touchUpInside)
    }
    
    //settingButton
    @objc
    func touchupSettingButton() {
        print("setting")
    }
    //addButton
    @objc func touchupAddButton() {
        print("Add")
    }
}

extension ChatViewController {
    
    private func layout() {
        view.backgroundColor = .white
        
        view.addSubview(topBarView)
        [chatLabel, openChatLabel, addButton, settingButton].forEach{
            topBarView.addSubview($0)
        }
        
        view.addSubview(chatCollectionView)
        chatCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(chatList.count * 50)
        }
        
        topBarView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.topBarView.snp.centerY)
            make.leading.equalTo(self.topBarView.snp.leading).offset(14)
        }
        
        openChatLabel.snp.makeConstraints { make in
            make.centerY.equalTo(chatLabel)
            make.leading.equalTo(chatLabel.snp.trailing).offset(7)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(chatLabel)
            make.trailing.equalTo(self.topBarView.snp.trailing).offset(-15)
            make.height.width.equalTo(19)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(chatLabel)
            make.trailing.equalTo(self.settingButton.snp.leading).offset(-16)
            make.height.width.equalTo(19)
        }
    }
        
        // MARK: - General Helpers
        
        private func register() {
            chatCollectionView.register(
                ChatCollectionViewCell.self,
                forCellWithReuseIdentifier: ChatCollectionViewCell.identifier
            )
        }
}


extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 0, bottom: 10, right: 0)
    }
}

// MARK: -UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath)
                as? ChatCollectionViewCell else { return UICollectionViewCell() }
        chatCell.dataBind(model: chatList[indexPath.item])
        return chatCell
    }
}
