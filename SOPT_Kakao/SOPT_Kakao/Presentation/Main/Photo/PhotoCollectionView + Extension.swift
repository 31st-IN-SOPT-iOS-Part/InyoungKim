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
        photoCell.dataBind(model: photoList[indexPath.item], isSelected: photoCell.isSelected)
        return photoCell
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let photoCell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell else {
            return true}
        if photoCell.isSelected {
            photoCollectionView.deselectItem(at: indexPath, animated: true)
            return false
        } else {
            return true
        }
    }
}
