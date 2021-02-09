//
//  ViewController.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 2/1/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    let centerLabel = UILabel()
    let someTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Something intersting"
        tf.borderStyle = .roundedRect
        tf.returnKeyType = .done
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    let someTextField2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Something intersting 2"
        tf.borderStyle = .roundedRect
        tf.returnKeyType = .done
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()

    func initUI() {
        view.backgroundColor = .systemBackground
        centerLabel.text = "Notice me"
        someTextField.delegate = self
        someTextField2.delegate = self
        view.addSubview(centerLabel)
        view.addSubview(someTextField)
        view.addSubview(someTextField2)
        initUI_SnapKit()
    }
    
    func initUI_NSLayout() {
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        someTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            someTextField.topAnchor.constraint(equalTo: centerLabel.bottomAnchor, constant: 10),
            someTextField.centerXAnchor.constraint(equalTo: centerLabel.centerXAnchor),
            someTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func initUI_SnapKit() {
        centerLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview().offset(60)
        }
        someTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(centerLabel.snp.bottom).offset(10)
            maker.centerX.equalTo(centerLabel.snp.centerX)
            maker.width.equalToSuperview().dividedBy(2)
        }
        someTextField2.snp.makeConstraints { (maker) in
            maker.top.equalTo(someTextField.snp.bottom).offset(10)
            maker.centerX.equalTo(centerLabel.snp.centerX)
            maker.width.equalToSuperview().dividedBy(2)
        }
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == someTextField2 {
            print(someTextField2.text ?? "")
            return true
        }
        centerLabel.text = textField.text
        textField.resignFirstResponder()
        return true
    }

}
