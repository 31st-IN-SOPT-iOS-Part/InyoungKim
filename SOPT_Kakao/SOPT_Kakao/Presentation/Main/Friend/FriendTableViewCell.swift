//
//  FriendTableViewCell.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/31.
//

import UIKit
import SnapKit
import Then

class FriendTableViewCell: UITableViewCell {

    static let identifier = "FriendTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // MARK: - UI Components
    private let friendContainerView = UIView()
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    private let friendStatusLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    func dataBind(model: FriendModel) {
        friendNameLabel.text = model.name
        friendImageView.image = UIImage(named: model.profileImage)
        friendStatusLabel.text = model.statusMessage
    }
    
    func myDataBind(model: FriendModel, isMyProfile: Bool) {
        dataBind(model: model)
        
        if isMyProfile == true {
            friendNameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
            friendStatusLabel.font = .systemFont(ofSize: 11, weight: .regular)
        }
    }
}

extension FriendTableViewCell {
    func layout() {
        [friendContainerView, friendImageView, friendNameLabel, friendStatusLabel].forEach {
            contentView.addSubview($0)
        }
                
        friendContainerView.addSubview(friendImageView)
        
        friendContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(contentView.snp.height)
        }
                
        friendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
                
        friendNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(friendContainerView.snp.trailing).offset(15)
        }
                
        friendStatusLabel.snp.makeConstraints {
            $0.top.equalTo(friendNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(friendNameLabel)
        }
        
    }
}
