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
    
    var isCellSelected : Bool = false {
        didSet{
            if isCellSelected {
                selectedLayout()
            }
            else {
                deselectedLayout()
            }
        }
    }
//    이거 썼을 때 왜 안되는지...?
//    override var isSelected: Bool {
//        didSet{
//            if isSelected {
//                selectedLayout()
//            }
//            else {
//                deselectedLayout()
//            }
//        }
//    }
    
    //MARK: - Identifier
    static let identifier = "PhotoCollectionViewCell"

    //MARK: - UI Components
    let photoImage = UIImageView()
    let indexNumLabel = UILabel()
    
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
        contentView.addSubViews(photoImage, indexNumLabel)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        indexNumLabel.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.trailing.equalTo(photoImage)
        }
        
    }
    
    // 사진이 선택됐을 때의 레이아웃
    func selectedLayout() {
        contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.systemYellow.cgColor
        self.indexNumLabel.isHidden = false
        self.indexNumLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        self.indexNumLabel.backgroundColor = .systemYellow
    }
    
    // 사진 선택 해제
    func deselectedLayout() {
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.indexNumLabel.isHidden = true
    }
    
    // MARK: - DataBind
    func dataBind(model: PhotoModel) {
        photoImage.image = UIImage(named: model.photo)
    }
}

