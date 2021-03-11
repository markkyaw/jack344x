//
//  SpinnerViewController.swift
//  jack
//
//  Created by Paing Kyaw on 2/22/21.
//

import UIKit

class SpinnerViewController: UIViewController {
    
    init() {
        // Call parent constructor
        // both nil cuz not using storyboard
        super.init(nibName: nil, bundle, nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgColor = UIColor.systemBackground.withAlphaComponent(0.75)
        view.backgroundColor = bgColor
        let spinner = UIActivityIndicatorView(style: .large)
        view.addSubview(spinner)
        spinner.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        spinner.startAnimating()
    }
    
    
}
