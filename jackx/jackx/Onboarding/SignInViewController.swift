//
//  SignInViewController.swift
//  jack
//
//  Created by Paing Kyaw on 2/8/21.
//

import UIKit
import FirebaseAuth

class SignInViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    let stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()
    
    let attributedTitleLabel: UILabel = {
        let l = UILabel()
        l.attributedText = NSAttributedString(string: "focus", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30),
            NSAttributedString.Key.kern: 20,
        ] )
        return l
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Email"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let pwTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let signInButton: UIButton = {
        let b = UIButton()
        b.setAttributedTitle(NSAttributedString(string: "SIGN IN", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular),
            // Color of text, systemBackground is black in light, white in dark mode
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]), for: .normal)
        // this is background color, label is text color
        b.backgroundColor = .label
        let height: CGFloat = 50
        b.heightAnchor.constraint(equalToConstant: height).isActive = true
        // for perfect semi circle, 1/2 height
        b.layer.cornerRadius = height / 2
        // spread of shadow
        b.layer.shadowRadius = 5
        b.layer.shadowColor = UIColor.black.cgColor
        b.layer.shadowOpacity = 0.5
        b.layer.shadowOffset = CGSize(width: 0, height: 2)
        // first arg: self
        // second arg: functoin triggered
        // third arg: how is it triggered
        b.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return b
    }()
    
    let spacer = UIView()
    // empty UI viewfor gap between signin btn and create new account
    
    let createAccountButton: UIButton = {
        let b = UIButton()
        b.setAttributedTitle(NSAttributedString(string: "Create new account",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .medium),
                NSAttributedString.Key.foregroundColor: UIColor.systemOrange
            ]), for: .normal)
        b.addTarget(self, action: #selector(createAccountAction), for: .touchUpInside)
        return b
    }()
    
    let forgotPWButton: UIButton = {
        let b = UIButton()
        b.setAttributedTitle(NSAttributedString(string: "Forgot password?",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .thin),
            ]), for: .normal)
        b.addTarget(self, action: #selector(forgotPWAction), for: .touchUpInside)
        return b
    }()
    
    func initUI() {
        // only do this once, the rest will be addArrangedSubview
        view.addSubview(stackView)
        stackView.snp.makeConstraints{ (make) in
            // Safe areas
            // top margin (notch area)
            make.bottomMargin.leadingMargin.trailingMargin.equalToSuperview()
            make.topMargin.equalToSuperview().offset(50)
        }
        // use addArrangedSubview to treat stackView as a proper stackview
        // otherwise it doesn't have any constraints
        // Same as for loop below
//        stackView.addArrangedSubview(attributedTitleLabel)
//        stackView.addArrangedSubview(emailTextField)
//        stackView.addArrangedSubview(pwTextField)
        
        for view in [attributedTitleLabel, emailTextField, pwTextField, signInButton, spacer, createAccountButton, forgotPWButton] {
            stackView.addArrangedSubview(view)
        }
        // inc space between label and email field
        stackView.setCustomSpacing(50, after: attributedTitleLabel)
        // remove the spacing between create account and forgot pw
        stackView.setCustomSpacing(0, after: createAccountButton)
    }
}

extension SignInViewController {
    // need @objc cuz #selector is on objc syntax
    @objc func signInAction() {
        print("Signed In")
        guard let email = emailTextField.text else { return }
        guard let pw = pwTextField.text else { return }
        let spinner = SpinnerViewController()
        present(spinner, animated: true, completion: nil)
        // Artifical delay for testing, deadlines means how long to wait
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Everything in here will be executed 2 seconds later cuz .now() + 2
            Auth.auth().signIn(withEmail: email, password: pw) { (result, error) in
                // Dismiss the spinner when we get results back over the network
                spinner.dismiss(animated: true, completion: nil)
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                // print(result?.user)
            }
        }
        
    }
    
    @objc func createAccountAction() {
        print("Create Account")
        present(SignUpViewController(), animated: true, completion: nil)
    }
    
    @objc func forgotPWAction() {
        let alert = UIAlertController(title: "Forgot Password", message: "Receive a passowrd recovery email", preferredStyle: .alert)
        
        alert.addTextField{ (tf) in
            tf.placeholder = "Email Address"
            tf.autocorrectionType = .no
            tf.keyboardType = .emailAddress
        }
        
        // style has default, destructive, cancel
        let submitAction = UIAlertAction(title: "Recover Password", style: .default) { (_) in
            // code to execute when user clicks on the button
            // alert.textFields is optional just for safe unwrap
            if let tfs = alert.textFields {
                guard let email = tfs.first?.text else { return }
                Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    print("Password resent email sent")
                }
                // Use Firebase to send forgot password email
                // Display loading indicator
                // Dismiss the loading indicator after Firebase confirms the email has been sent
            }
        }
        alert.addAction(submitAction)
        present(alert, animated: true, completion: nil)
    }
}
