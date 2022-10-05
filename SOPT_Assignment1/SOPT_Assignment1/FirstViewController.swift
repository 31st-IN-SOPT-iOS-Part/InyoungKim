//
//  FirstViewController.swift
//  SOPT_Assignment1
//
//  Created by 김인영 on 2022/10/02.
//

import UIKit

class FirstViewController: UIViewController {
    
    //카카오톡을 시작합니다
    private let mainTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 110, width: 300, height: 40))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //계정이 있다면 로그인 해달라는 메세지문구
    private let detailLabel: UILabel = {
        let detailLabel = UILabel(frame: CGRect(x: 40, y: 160, width: 300, height: 60))
        detailLabel.text = "사용하던 카카오계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        detailLabel.font = .systemFont(ofSize: 15)
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        return detailLabel
    }()
    
    //이메일 또는 전화번호를 입력
    private let inputEmailNumberTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 280, width: 350, height: 40))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    //비밀번호 입력
    private let inputPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 330, width: 350, height: 40))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    
    //Underline UIView
    //(1) inputEmailNumber textField 밑에 들어갈 밑줄
    private lazy var emailNumberUnderLineView: UIView = {
        let lineView: UIView = UIView(frame: CGRect(x: 22, y: 320, width: 350, height: 1))
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    //(2) inputPassword textField 밑에 들어갈 밑줄
    private lazy var pwUnderLineView: UIView = {
        let lineView: UIView = UIView(frame: CGRect(x: 22, y: 370, width: 350, height: 1))
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    
    //카카오계정 로그인 버튼
    private lazy var loginBtn : UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 420, width: 350, height: 40))
        button.setTitle("카카오 계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchupLoginBtn), for: .touchUpInside)
        return button
    }()
    
    //회원가입 버튼
    private lazy var signUpBtn : UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 470, width: 350, height: 40))
        button.setTitle("새로운 카카오 계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchupSignUpBtn), for: .touchUpInside)
        return button
    }()
    
    //카카오 계정 또는 비밀번호 찾는 버튼
    private let findAccoutBtn : UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 520, width: 350, height: 30))
        button.setTitle("카카오 계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = .white
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [mainTitleLabel, detailLabel, inputEmailNumberTextField, inputPasswordTextField, loginBtn, signUpBtn, findAccoutBtn, emailNumberUnderLineView, pwUnderLineView]
        components.forEach {
            self.view.addSubview($0 as! UIView)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let yourname = inputEmailNumberTextField.text{
            welcomeVC.dataBind(name: yourname)
        }
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    private func pushToSignUpVC() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

    //로그인
    @objc
    private func touchupLoginBtn() {
        //welcomeVC로 present
        presentToWelcomeVC()
    }
    
    //회원가입
    @objc
    private func touchupSignUpBtn() {
        // 회원가입 페이지로 push
        pushToSignUpVC()
    }
}
