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
        
        let button3 = self.myButton(title: "基础部分", action: #selector(theBasics))
        myScrollView!.addSubview(button3)
        self.increaseScrollViewContentH()
        
        let button4 = self.myButton(title: "基本运算符", action: #selector(basicOperator))
        myScrollView!.addSubview(button4)
        self.increaseScrollViewContentH()
        
        let button5 = self.myButton(title: "字符串和字符", action: #selector(stringsAndCharacters))
        myScrollView!.addSubview(button5)
        self.increaseScrollViewContentH()
        
        let button6 = self.myButton(title: "集合类型", action: #selector(collectionTypes))
        myScrollView!.addSubview(button6)
        self.increaseScrollViewContentH()
    }
    
    @objc private func collectionTypes() {
        self.navigationController?.pushViewController(ContentVC1(type: .CollectionTypes), animated: true)
    }
    
    @objc private func stringsAndCharacters() {
        self.navigationController?.pushViewController(ContentVC1.init(type: .StringsAndCharacters), animated: true)
    }
    
    @objc private func basicOperator() {
        self.navigationController?.pushViewController(ContentVC1.init(type: .BasicOperator), animated: true)
    }
    
    @objc private func theBasics() {
        self.navigationController?.pushViewController(ContentVC1.init(type: .TheBasics), animated: true)
    }
    
    @objc private func aboutSwift()  {
        self.navigationController?.pushViewController(ContentVC1.init(type: .AboutSwift), animated: true)
    }
    
    @objc private func swiftTour() {
        self.navigationController?.pushViewController(ContentVC1.init(type: .SwiftTour), animated: true)
    }
    
}


