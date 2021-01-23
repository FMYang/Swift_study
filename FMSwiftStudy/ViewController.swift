//
//  ViewController.swift
//  FMSwiftStudy
//
//  Created by yfm on 2020/12/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 1
    convenience init(style: String) {
        self.init()
    }
    
    // 2
//    init(style: String) {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
