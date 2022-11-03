//
//  MainViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/12.
//

import UIKit
import SnapKit

class FriendListViewController: UIViewController {
    
    let myName : String = UserDefaults.standard.string(forKey: "userName") ?? "인영쓰"
    
    //MARK: - UI Components
    //친구 View
    private let friendView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //친구
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    // 설정 버튼
    private lazy var settingButton : UIButton = {
        let settingBtn = UIButton()
        settingBtn.setBackgroundImage(UIImage(named : "settings1"), for: .focused)
        settingBtn.addTarget(self, action: #selector(touchupSettingButton), for: .touchUpInside)
        return settingBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getUserInfo()
        setLayout()
        tableLayout()
        register()
    }
    
    // UserDefaults애 있는 정보를 받아옴
    func getUserInfo() {
        friendList[0].name = myName
    }
    
    //settingButton
    @objc
    func touchupSettingButton() {
        print("setting")
    }

    // Friend TableView생성
    private lazy var friendTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //var myModel : MyModel = MyModel(name: "인영", profileImage: "friendtab_profileImg", statusMessage: "멋찐 아요 개발자가 될래욥")
    
    // FriendList
    var friendList : [FriendModel] = [
        FriendModel(name: "인영", profileImage: "friendtab_profileImg", statusMessage: "멋찐 아요 개발자가 될래욥"),
        FriendModel(name: "안솝트", profileImage: "profileImage1", statusMessage: "언제 볼건데??"),
        FriendModel(name: "최솝트", profileImage: "profileImage2", statusMessage: "피곤해요"),
        FriendModel(name: "정솝트", profileImage: "profileImage3", statusMessage: "아요 짱"),
        FriendModel(name: "강솝트", profileImage: "profileImage4", statusMessage: "솝트 짱"),
        FriendModel(name: "오솝트", profileImage: "profileImage5", statusMessage: "유대"),
        FriendModel(name: "황솝트", profileImage: "profileImage6", statusMessage: "몰입"),
        FriendModel(name: "최솝트", profileImage: "profileImage7", statusMessage: "도전"),
        FriendModel(name: "정솝트", profileImage: "profileImage3", statusMessage: "아요 짱"),
        FriendModel(name: "강솝트", profileImage: "profileImage4", statusMessage: "솝트 짱"),
        FriendModel(name: "오솝트", profileImage: "profileImage5", statusMessage: "유대"),
        FriendModel(name: "황솝트", profileImage: "profileImage6", statusMessage: "몰입"),
        FriendModel(name: "최솝트", profileImage: "profileImage7", statusMessage: "도전"),
        FriendModel(name: "고솝트", profileImage: "profileImage8", statusMessage: "하암"),
        FriendModel(name: "하솝트", profileImage: "profileImage9", statusMessage: "공부시로링"),
    ]
    
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
    
}

extension FriendListViewController {
    
    func setLayout() {
        
        // 친구, 설정버튼을 friendView에 추가
        friendView.addSubViews(friendLabel, settingButton)
        
        settingButton.snp.makeConstraints { make in
            make.centerX.equalTo(friendLabel)
            make.trailing.equalTo(self.friendView.snp.trailing).offset(-15)
            make.height.width.equalTo(19)
        }
        
        view.addSubViews(friendView)
        
        friendView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.friendView.snp.centerY)
            make.leading.equalTo(self.friendView.snp.leading).offset(14)
        }
    }
}

extension FriendListViewController : UITableViewDelegate, UITableViewDataSource {

    private func tableLayout() {
        view.backgroundColor = .white
        view.addSubview(friendTableView)
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(friendView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * (friendList.count))
        }
    }
    
    
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

