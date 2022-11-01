//
//  PhotoCollectionViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/11/01.
//

import UIKit
import SnapKit
import Then

class PhotoCollectionViewController: UIViewController {
    
    //MARK: - UIComponents
    // 상단 바
    private let topBarView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // 최근 항목
    private let recentLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    // 전송 버튼
    private lazy var sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
    }
    
    // backButton
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
        $0.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
    }
    
    //MARK: - CollectionVC
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        
    }
    
    //MARK: -  PhotoList
    var photoList: [PhotoModel] = [
        PhotoModel(photo: "Frame 17"),
        PhotoModel(photo: "galleryImage1"),
        PhotoModel(photo: "galleryImage2"),
        PhotoModel(photo: "galleryImage3"),
        PhotoModel(photo: "galleryImage4"),
        PhotoModel(photo: "galleryImage5"),
        PhotoModel(photo: "galleryImage6"),
        PhotoModel(photo: "galleryImage7"),
        PhotoModel(photo: "galleryImage8"),
        PhotoModel(photo: "galleryImage9"),
        PhotoModel(photo: "galleryImage10"),
        PhotoModel(photo: "galleryImage11"),
        PhotoModel(photo: "galleryImage12"),
        PhotoModel(photo: "galleryImage13"),
        PhotoModel(photo: "galleryImage14"),
        PhotoModel(photo: "galleryImage15"),
        PhotoModel(photo: "galleryImage16"),
        PhotoModel(photo: "galleryImage17"),
        PhotoModel(photo: "galleryImage18"),
        PhotoModel(photo: "galleryImage19"),
        PhotoModel(photo: "galleryImage20"),
        PhotoModel(photo: "galleryImage21"),
        PhotoModel(photo: "galleryImage22"),
        PhotoModel(photo: "galleryImage23"),
    ]
    
    final let photoInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    final let photoLineSpacing: CGFloat = 7
    final let photoInterItemSpacing: CGFloat = 9
    final let photoCellHeight: CGFloat = 119
    
    //backButton
    @objc
    func tapBackButton() {
        self.dismiss(animated: true)
    }
    //sendButton
    @objc
    func tapSendButton() {
        print("전송완")
    }
}

extension PhotoCollectionViewController {
    
    func layout() {
        view.backgroundColor = .white
        view.addSubViews(topBarView, photoCollectionView)
        
        topBarView.addSubViews(backButton, recentLabel, sendButton)
        
        topBarView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(38)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.height.width.equalTo(24)
        }
        
        recentLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        sendButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        
        //collectionView layout
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(calculateHeight())
        }
        
    
    }
    
    // collectionView의 height 계산
    func calculateHeight() -> CGFloat {
        let count = CGFloat(photoList.count)
        let remainder : Double
        
        if count.truncatingRemainder(dividingBy: 3) != 0 {
            remainder = 1
        } else {
            remainder = 0
        }
        
        let heightCount = count / 3 + remainder
        
        return heightCount * photoCellHeight + (heightCount - 1) * photoLineSpacing + photoInset.top + photoInset.bottom
    }
    
    private func register() {
        photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
}


extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - photoInset.left - photoInset.right - photoInterItemSpacing * 2
        return CGSize(width: doubleCellWidth / 3, height: photoCellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoInset
    }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }
}
