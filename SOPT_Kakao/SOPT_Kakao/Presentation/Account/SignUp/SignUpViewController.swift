//
//  SignUpViewController.swift
//  SOPT_Kakao
//
//  Created by 김인영 on 2022/10/09.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    //카카오톡을 실행합니다
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
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
    
    //비밀번호 확인
    private let checkPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    //underline UIView
    //(1) inputEmailNumber textField 밑줄
    private lazy var emailNumberUnderLineView: UIView = {
        let lineView: UIView = UIView()
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    //(2) inputPassword textField 밑줄
    private lazy var pwUnderLineView: UIView = {
        let lineView: UIView = UIView()
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    //(3) checkPassword textField 밑줄
    private lazy var checkPWUnderLineView: UIView = {
        let lineView: UIView = UIView()
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    //새로운 카카오계정 만들기 버튼
    private lazy var signUpBtn: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오 계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchupLoginBtn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    //welcomeVC로 present
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let yourname = inputEmailNumberTextField.text {
            // 이메일 또는 전화번호를 입력하지 않은 경우 -> toastMessage 띄움
            if yourname == "" || inputPasswordTextField.text == "" || checkPasswordTextField.text == "" {
                showToast(message: "입력되지 않았습니다", font: UIFont.systemFont(ofSize: 12, weight: .light))
            } else {
                // 올바르게 입력된 경우
                welcomeVC.dataBind(name: yourname)
                self.present(welcomeVC, animated: true, completion: nil)
            }
        }
    }
    
    //로그인
    @objc
    private func touchupLoginBtn() {
        presentToWelcomeVC()
    }
    
}

extension SignUpViewController {
    
    func setLayout() {
        view.addSubViews(mainTitleLabel, inputEmailNumberTextField, inputPasswordTextField, checkPasswordTextField, signUpBtn, emailNumberUnderLineView, pwUnderLineView, checkPWUnderLineView)
        
        //카카오톡을 실행합니다
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(89)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-89)
            make.height.equalTo(25)
        }
        
        //이메일 또는 전화번호 입력
        inputEmailNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(self.mainTitleLabel.snp.bottom).offset(116)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(49)
        }
        
        //비밀번호 입력
        inputPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.inputEmailNumberTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(49)
        }
        
        //비밀번호 확인
        checkPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.inputPasswordTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(49)
        }
        
        
        //UnderlineView
        emailNumberUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(inputEmailNumberTextField.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(1)
        }
        pwUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(inputPasswordTextField.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(1)
        }
        checkPWUnderLineView.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordTextField.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(1)
        }
        
        //회원가입 버튼
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordTextField.snp.bottom).offset(26)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(45)
        }
        
    }
        
}
