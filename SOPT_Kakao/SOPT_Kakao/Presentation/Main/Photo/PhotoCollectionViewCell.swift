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
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                selectedLayout()
            }
            else {
                deselectedLayout()
            }
        }
    }
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
    
    // 사진이 선택됐을 때의 레이아웃
    func selectedLayout() {
        contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.systemYellow.cgColor
    }
    
    // 사진 선택 해제
    func deselectedLayout() {
        self.contentView.layer.borderColor = UIColor.clear.cgColor
    }
    
    // MARK: - DataBind
    func dataBind(model: PhotoModel, isSelected: Bool) {
        photoImage.image = UIImage(named: model.photo)
        self.isSelected = isSelected
    }
}

