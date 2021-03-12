//
//  P2ViewController.swift
//  jackx
//
//  Created by Mark Kyaw on 3/11/21.
//

import UIKit

class P2ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nothing to see here"
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////            pop self off
//            self.navigationController?.popViewController(animated: true)
//        }
        
//        Anything adding to a view must be a view itself
        let imageView = UIImageView(image: #imageLiteral(resourceName: "NavBG"))
//        modify behavior of img
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
