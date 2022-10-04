//
//  WelcomeViewController.swift
//  SOPT_Assignment1
//
//  Created by 김인영 on 2022/10/02.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //OOO님 환영합니다
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 70))
        label.text = "니 누군데!"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    //확인 버튼
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 400, width: 350, height: 40))
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [nameLabel, backButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    func dataBind(name: String) {
        nameLabel.text = "\(name) 님\n 환영합니다"
    }
    
    @objc
    private func touchupBackButton() {
        self.dismiss(animated: true, completion: nil)
    }

}
