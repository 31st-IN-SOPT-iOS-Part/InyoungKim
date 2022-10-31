//
//  ChatCollectionViewCell.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/31.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ChatCollectionViewCell"
    
    // MARK: - UI Components
    
    private let chatContainerView = UIView()
    private let chatImageView = UIImageView()
    private let chatNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    private let chatMessageLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extensions

extension ChatCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        
        [chatContainerView, chatNameLabel, chatMessageLabel].forEach {
            contentView.addSubview($0)
        }
        
        chatContainerView.addSubview(chatImageView)
        chatContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(41)
        }
        
        chatImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        chatNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(chatContainerView.snp.trailing).offset(11)
        }
        
        chatMessageLabel.snp.makeConstraints {
            $0.top.equalTo(chatNameLabel.snp.bottom).offset(1)
            $0.leading.equalTo(chatNameLabel)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: ChatModel){
        chatNameLabel.text = model.name
        chatImageView.image = UIImage(named: model.profileImage)
        chatMessageLabel.text = model.message
    }
}
