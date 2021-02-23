//
//  SignUpViewController.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 2/22/21.
//

import UIKit

class SignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    let attributedTitleLabel: UILabel = {
        let l = UILabel()
        l.attributedText = NSAttributedString(string: "focus", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .regular),
            NSAttributedString.Key.kern: 20
        ])
        l.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return l
    }()

    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Email"
        tf.autocorrectionType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()

    let pwTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let confPwTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Confirm Password"
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        return tf
    }()

    let createAccountButton: UIButton = {
        let b = UIButton()
        b.setAttributedTitle(NSAttributedString(string: "SIGN UP", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground,
        ]), for: .normal)
        b.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        b.backgroundColor = .label
        b.layer.shadowRadius = 3
        b.layer.shadowOffset = CGSize(width: 0, height: 2)
        b.layer.shadowColor = UIColor.label.cgColor
        b.layer.shadowOpacity = 0.5
        let height: CGFloat = 50
        b.heightAnchor.constraint(equalToConstant: height).isActive = true
        b.layer.cornerRadius = height / 2
        return b
    }()

    let spacer = UIView()

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()

    func initUI() {
        for view in [attributedTitleLabel, emailTextField, pwTextField, confPwTextField, createAccountButton, spacer] {
            stackView.addArrangedSubview(view)
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.leadingMargin.trailingMargin.equalToSuperview()
            make.topMargin.equalToSuperview().offset(50)
            make.bottomMargin.equalToSuperview().offset(-10)
        }
        stackView.setCustomSpacing(50, after: attributedTitleLabel)
        stackView.setCustomSpacing(20, after: confPwTextField)
    }
    
}

extension SignUpViewController {
    
    @objc func signUpAction() {
        
    }
    
}
