//
//  ViewController.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/18.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1: UIButton = self.myButton(title: "关于Swift", action: #selector(_aboutSwift))
        myScrollView!.addSubview(button1)
        self.increaseScrollViewContentH()
    }
    
    @objc func _aboutSwift() -> Void  {
        self.navigationController?.pushViewController(AboutSwiftVC.init(), animated: true)
    }
    
    
}


