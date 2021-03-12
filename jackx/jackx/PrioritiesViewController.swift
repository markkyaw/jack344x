//
//  PrioritiesViewController.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 2/8/21.
//

import UIKit

class PrioritiesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        stackView.addArrangedSubview(view1)
//        stackView.addArrangedSubview(view2)
//        view.addSubview(stackView)
//        stackView.snp.makeConstraints { (make) in
//            make.topMargin.bottomMargin.leadingMargin.trailingMargin.equalToSuperview()
//        }
        view.addSubview(view1)
        view.addSubview(view2)
        view2.snp.makeConstraints { (make) in
//            safeAreaLayout excludes notch and bottom nav bar
            make.top.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
//            constraint middle to each other
            make.leading.equalTo(view1.snp.trailing)
        }
        view1.snp.makeConstraints { (make) in
//            safeAreaLayout excludes notch and bottom nav bar
            make.top.bottom.leading.equalTo(view.safeAreaLayoutGuide)
//            constraint middle to each other
            make.trailing.equalTo(view2.snp.leading)
        }
        
        title = "Priorities"
        navigationController?.hidesBarsOnTap = true
//        Applies to bar
//        navigationController?.navigationBar.barTintColor = .red
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "NavBG"), for: .default)
//        Applies to all items
//        navigationController?.navigationBar.tintColor = .cyan
//        Change color of title
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
//        Use icons from given library in barButtonSystemItem
        navigationItem.setRightBarButtonItems([UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goToPinkVC))], animated: false)
//        navigationItem.setRightBarButtonItems([UIBarButtonItem(image: #imageLiteral(resourceName: "NavBG"), style: .plain, target: nil, action: nil)], animated: false)
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
////            self.dismiss(animated: true) {
////                print("Dismissed?")
////            }
//            // pop is opposite to push like dismiss is to present
//            self.navigationController?.popViewController(animated: true)
//        }
    }
    
    @objc func goToPinkVC() {
//        present(P2ViewController(), animated: true, completion: nil)
        navigationController?.pushViewController(P2ViewController(), animated: true)
    }
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.axis = .horizontal
        sv.distribution = .fill
        return sv
    }()
    
    let view1: UILabel = {
        let v = UILabel()
        v.backgroundColor = .blue
        v.text = "View 1 View 1 View 1 View 1 View 1"
//        v.text = "View 1"
//        ContentCompressionResistancePriority - how restsitance the view is from being compressed, the one with higher number gets priority (more space)
//        if tied priority, whichever gets added first gets priority
        v.setContentCompressionResistancePriority(UILayoutPriority(100), for: .horizontal)
//        ContentHuggingPriority - how restsitance the view is from being streteched. defaultLow = View1 compared to view2 cares less about if it's gonna be stretched or not
//        v.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return v
    }()
    
    let view2: UILabel = {
        let v = UILabel()
        v.backgroundColor = .green
        v.text = "View 2 View 2 View 2 View 2 View 2"
//        v.text = "View 2"
        v.setContentCompressionResistancePriority(UILayoutPriority(101), for: .horizontal)
        return v
    }()
}
