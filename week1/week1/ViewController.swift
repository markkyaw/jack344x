//
//  ViewController.swift
//  week1
//
//  Created by Paing Kyaw on 1/25/21.
//

import UIKit

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
        tf.returnKeyType = .emergencyCall
        // Grays out return key when text field is empty
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()

    func initUI() {
        // .label is invert
        // .systemBackground is based on system theme
        view.backgroundColor = .systemBackground
        centerLabel.text = "Notice me"
    }

}

