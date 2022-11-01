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
    //상단 바
    private let topBarView = UIView()
    
    private lazy var backButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
        $0.tintColor = .black
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
        //collectionView.delegate = self
        //collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        //register()
        
    }
    
    //MARK: -  PhotoList
    var photoList: [PhotoModel] = [
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
    
    //backButton
    @objc
    func tapBackButton() {
        print("back")
        //self.dismiss(animated: true)
    }
}

extension PhotoCollectionViewController {
    
    func layout() {
        view.backgroundColor = .white
        view.addSubview(topBarView)
        topBarView.addSubview(backButton)
        
        topBarView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(38)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(topBarView).offset(12)
            make.height.width.equalTo(24)
        }
    }
    
    
//    func register() {
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    }
}


//// MARK: UICollectionViewDataSource
//extension PhotoCollectionViewController : UICollectionViewDataSource {
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }
//}

//extension PhotoCollectionViewController : UICollectionViewDelegate {
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//
//    }
//    */
//
//}
