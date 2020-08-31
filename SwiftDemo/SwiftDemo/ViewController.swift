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
        let button1: UIButton = self.myButton(title: "关于Swift", action: #selector(aboutSwift))
        myScrollView!.addSubview(button1)
        self.increaseScrollViewContentH()
        
        let button2 = self.myButton(title: "Swift初见", action: #selector(swiftTour))
        myScrollView!.addSubview(button2)
        self.increaseScrollViewContentH()
    }
    
    @objc private func aboutSwift()  {
        self.navigationController?.pushViewController(ContentVC1.init(type: .AboutSwift), animated: true)
    }
    
    @objc private func swiftTour() {
        self.navigationController?.pushViewController(ContentVC1.init(type: .SwiftTour), animated: true)
    }
    
}


