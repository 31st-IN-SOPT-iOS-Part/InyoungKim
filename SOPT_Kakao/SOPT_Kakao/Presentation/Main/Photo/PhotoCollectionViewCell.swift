//
//  PhotoCollectionViewCell.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/11/02.
//

import UIKit
import SnapKit
import Then

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "PhotoCollectionViewCell"
    
    //MARK: - UI Components
    private let photoImage = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCollectionViewCell {
    func layout() {
        contentView.addSubview(photoImage)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(model: PhotoModel) {
        photoImage.image = UIImage(named: model.photo)
    }
}

