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
    
}

extension ChatViewController {
    
    private func layout() {
            view.backgroundColor = .white
            view.addSubview(chatCollectionView)
            chatCollectionView.snp.makeConstraints {
                $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                $0.bottom.equalToSuperview()
                $0.height.equalTo(chatList.count * 50)
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
