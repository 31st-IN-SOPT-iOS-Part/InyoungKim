//
//  SignInViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/09.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    //카카오톡을 시작합니다
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //계정이 있다면 로그인 해달라는 메세지문구
    private let detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.text = "사용하던 카카오계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        detailLabel.font = .systemFont(ofSize: 15)
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .center
        return detailLabel
    }()
    
    //이메일 또는 전화번호를 입력
    private let inputEmailNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    //비밀번호 입력
    private let inputPasswordTextField: UITextField = {
        let textField = UITextField()
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
        let lineView: UIView = UIView()
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    //(2) inputPassword textField 밑에 들어갈 밑줄
    private lazy var pwUnderLineView: UIView = {
        let lineView: UIView = UIView()
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    //카카오계정 로그인 버튼
    private lazy var loginBtn : UIButton = {
        let button = UIButton()
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
        let button = UIButton()
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
        let button = UIButton()
        button.setTitle("카카오 계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = .white
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        
        if let yourname = inputEmailNumberTextField.text{
            
            // 이메일 또는 전화번호를 입력하지 않은 경우 -> toastMessage 띄움
            if yourname == "" || inputPasswordTextField.text == "" {
                self.showToast(message: "입력되지 않았습니다", font: UIFont.systemFont(ofSize: 12, weight: .light))
            } else {
                // 올바르게 입력된 경우
                welcomeVC.dataBind(name: yourname)
                self.present(welcomeVC, animated: true, completion: nil)
            }
        }
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

extension SignInViewController {
    func setLayout() {
        view.addSubViews(mainTitleLabel, detailLabel, inputEmailNumberTextField, inputPasswordTextField, loginBtn, signUpBtn, findAccoutBtn, emailNumberUnderLineView, pwUnderLineView)
        
        //카카오톡을 시작합니다
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-89)
            make.height.equalTo(25)
        }
        
        // 계정이 있다면 로그인 해달라는 메세지문구
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(self.mainTitleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        
        inputEmailNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(self.detailLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(49)
        }
        
        inputPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.inputEmailNumberTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(49)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(self.inputPasswordTextField.snp.bottom).offset(35)
            make.leading.trailing.equalTo(self.inputEmailNumberTextField)
            make.height.equalTo(44)
        }
        
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(self.loginBtn.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self.inputEmailNumberTextField)
            make.height.equalTo(44)
        }
        
        findAccoutBtn.snp.makeConstraints { make in
            make.top.equalTo(self.signUpBtn.snp.bottom).offset(15)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(99)
            make.height.equalTo(29)
        }
        
        //underLine
        emailNumberUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(inputEmailNumberTextField.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(1)
        }
        pwUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(inputPasswordTextField.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(1)
        }
    }
}
