//
//  ViewController.swift
//  jack
//
//  Created by Paing Kyaw on 1/25/21.
//

import UIKit
// pod -> install, update
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    let centerLabel = UILabel()
    // Using closure to keep everything together
    let someTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Something interesting"
        tf.borderStyle = .roundedRect
        tf.returnKeyType = .done
        // Grays out return key when text field is empty
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    
    let someTextField2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Something interesting 2"
        tf.borderStyle = .roundedRect
        tf.returnKeyType = .done
        // Grays out return key when text field is empty
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()

    func initUI() {
        // .label is invert
        // .systemBackground is based on system theme
        view.backgroundColor = .systemBackground
        centerLabel.text = "Notice me"
        someTextField.delegate = self
        someTextField2.delegate = self
//        initUI_NSLayout()
        view.addSubview(centerLabel)
        view.addSubview(someTextField)
        view.addSubview(someTextField2)
        initUI_SnapKit()
    }
    
    func initUI_NSLayout() {
        // Need to set it false and prioritize
        // Else will use default constraints
        // remain true if need to set something to absolute
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Can only equalt anchor same coordinate anchor x to x, not x to y
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        someTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // constant: 10 -> 10 pts under centerLabel subview
            someTextField.topAnchor.constraint(equalTo: centerLabel.bottomAnchor, constant: 10),
            someTextField.centerXAnchor.constraint(equalTo: centerLabel.centerXAnchor),
            someTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    // pod init
    // pod update for SnapKit
    func initUI_SnapKit() {
        centerLabel.snp.makeConstraints { (maker) in
            // Bottom 3 mtds are same
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview().offset(60)
            
            // Same
            // maker.centerX.centerY.equalToSuperview()
            
            // Same
            // maker.center.equalToSuperview()
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

// Extension is for organizing. Adding funcionatlity to existinig class
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == someTextField2 {
            print(someTextField2.text ?? "")
            return true
        }
        centerLabel.text = textField.text
        // Hide keyboard
        textField.resignFirstResponder()
        // return false -> doesn't do anything when hit enter
        return false
    }
    
}
