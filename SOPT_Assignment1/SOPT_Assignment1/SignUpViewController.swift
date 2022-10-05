//
//  SignUpViewController.swift
//  SOPT_Assignment1
//
//  Created by 김인영 on 2022/10/02.
//

import UIKit

class SignUpViewController: UIViewController {

    //카카오톡을 실행합니다
    private let mainTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 110, width: 300, height: 40))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
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
    
    //비밀번호 확인
    private let checkPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 380, width: 350, height: 40))
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
        let lineView: UIView = UIView(frame: CGRect(x: 22, y: 320, width: 350, height: 1))
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    //(2) inputPassword textField 밑줄
    private lazy var pwUnderLineView: UIView = {
        let lineView: UIView = UIView(frame: CGRect(x: 22, y: 370, width: 350, height: 1))
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    //(3) checkPassword textField 밑줄
    private lazy var checkPWUnderLineView: UIView = {
        let lineView: UIView = UIView(frame: CGRect(x: 22, y: 420, width: 350, height: 1))
        lineView.backgroundColor = .systemGray6
        return lineView
    }()
    
    
    //새로운 카카오계정 만들기 버튼
    private lazy var signUpBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 470, width: 350, height: 40))
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
        
        let componenets : [Any] = [mainTitleLabel, inputEmailNumberTextField, inputPasswordTextField, checkPasswordTextField, signUpBtn, emailNumberUnderLineView, pwUnderLineView, checkPWUnderLineView]
        componenets.forEach {
            self.view.addSubview($0 as! UIView)
        }
    }
    
    //welcomeVC로 present
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let yourName = inputEmailNumberTextField.text{
            welcomeVC.dataBind(name: yourName)
        }
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    //로그인
    @objc
    private func touchupLoginBtn() {
        presentToWelcomeVC()
    }
}
