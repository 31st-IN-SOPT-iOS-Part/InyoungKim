//
//  PhotoCollectionView + Extension.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/11/04.
//

import UIKit

//MARK: - UICollectionViewDelegateFlowLayout
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

// MARK: - UICollectionViewDataSource
extension PhotoCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
            
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }
    
    //didSelect 함수
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        if indexPath.row == 0 { // 카메라를 눌렀을 때
            print("카메라는 영어로 캐머라")
        } else { // 사진을 눌렀을 때
            print(cell.indexNumLabel.isHidden)
            if !cell.isCellSelected {
                cell.isCellSelected = true
                selectedPhotoArray.append(indexPath.item)
                print("추가됨요 -> \(selectedPhotoArray)")
            } else {
                cell.isCellSelected = false
                selectedPhotoArray.remove(at: Int(cell.indexNumLabel.text!)!-1)
            }
            
            if !selectedPhotoArray.isEmpty {
                for i in 0...selectedPhotoArray.count-1 {
                    let index = IndexPath(item: selectedPhotoArray[i], section: 0)
                    let cell = collectionView.cellForItem(at: index) as! PhotoCollectionViewCell
                    cell.indexNumLabel.text = "\(i+1)"
                }
            }
            
        }
        self.totalSelectedLabel.text = "\(selectedPhotoArray.count)"
    }
}
