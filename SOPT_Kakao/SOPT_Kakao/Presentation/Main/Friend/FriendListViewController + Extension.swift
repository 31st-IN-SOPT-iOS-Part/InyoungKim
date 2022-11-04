//
//  FriendListViewController + Extension.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/11/04.
//

import UIKit

extension FriendListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return FriendTableViewCell() }
        if indexPath.row == 0 {
            friendCell.myDataBind(model: friendList[indexPath.row], isMyProfile: true)
        } else {
            friendCell.dataBind(model: friendList[indexPath.row])
        }
        return friendCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 73
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ProfileDetailViewController()
        detailVC.dataBind(profile: friendList[indexPath.row])
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // UISwipeActionConfiguration를 이용한 delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row == 0 {
            print("나를 삭제하지마..")
            return nil
        } else {
            let deleteAction  = UIContextualAction(
                style: .destructive,
                title: "delete") {
                    action, view, completionHandler in
                    if indexPath.row == 0 {
                        completionHandler(false)
                    } else {
                        self.friendList.remove(at: indexPath.row)
                        self.friendTableView.reloadData()
                        completionHandler(true)
                    }
                }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    }
}

