//
//  ListViewController.swift
//  jackx
//
//  Created by Mark Kyaw on 3/11/21.
//

import UIKit

class ListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    let tableview: UITableView = {
//        Change change the style of tableview by playing with frame and style
//        frame: .zero, style: .plain is same as default constructor
        let tv = UITableView(frame: .zero, style: .grouped)
        // Register the cells
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "builtin")
//        Remove the line between each cells
//        tv.separatorStyle = .none
        return tv
    }()
    
    private func initUI() {
//        Tell tableview the source
        tableview.dataSource = self
//         react to user input
        tableview.delegate = self
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

// implement tableview.dataSource = self
extension ListViewController: UITableViewDataSource {
//    Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    Nums of row to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Manipulate # rows depending on sections
        if section == 0 {
            return 1
        }
        else {
            return 2
        }
    }
    
//    Manipulate row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        The first row of each section will be 50
        if indexPath.row == 0 {
            return 50
        }
        return 100
    }
    
//    Create titles before first rows
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Appetizer"
        }
        else {
            return "Entree"
        }
    }
    
//    Customize header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        let label = UILabel()
//        label.text = "ABC"
//        header.addSubview(label)
//        label.snp.remakeConstraints { (make) in
//            make.center.equalToSuperview()
//        }
//        return header
//    }
    
//    What to show in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        recylce cells out of view, modify content. Instead of allocating/deallocating resources constantly
        let cell = tableview.dequeueReusableCell(withIdentifier: "builtin", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Miller \(indexPath.row)"
            cell.imageView?.image = #imageLiteral(resourceName: "miller")
        }
        else {
            cell.textLabel?.text = "Allen \(indexPath.row)"
            cell.imageView?.image = #imageLiteral(resourceName: "allen")
        }
        
        return cell
    }
    
}

// implement tableview.delegate = self
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        print("User seelcted row \(indexPath.row)")
    }
}
