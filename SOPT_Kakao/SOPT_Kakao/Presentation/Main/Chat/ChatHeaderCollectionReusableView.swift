//
//  ChatCollectionReusableView.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/11/01.
//

import UIKit
import Then
import SnapKit

class ChatHeaderCollectionReusableView: UICollectionReusableView {
    
    static let viewIdentifier = "ChatHeaderCollectionReusableView"
        
    //MARK: - Life Cycle

    private let headerImage = UIImageView().then {
        $0.image = UIImage(named: "headerImage")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        //MARK: - Custom Method

    private func setLayout(){
        addSubview(headerImage)
        
        headerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(71)
            $0.width.equalTo(343)
        }
    }
}
