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
        
        let button7 = self.myButton(title: "控制流", action: #selector(controlFlow))
        myScrollView!.addSubview(button7)
        self.increaseScrollViewContentH()
        
        let button8 = self.myButton(title: "函数", action: #selector(functions))
        myScrollView!.addSubview(button8)
        self.increaseScrollViewContentH()
        
        let button9 = self.myButton(title: "闭包", action: #selector(closures))
        myScrollView!.addSubview(button9)
        self.increaseScrollViewContentH()
        
        let button10 = self.myButton(title: "枚举", action: #selector(enumerations))
        myScrollView!.addSubview(button10)
        self.increaseScrollViewContentH()
        
        let button11 = self.myButton(title: "类和结构体", action: #selector(structuresAndClasses))
        myScrollView!.addSubview(button11)
        self.increaseScrollViewContentH()
        
        let button12 = self.myButton(title: "属性", action: #selector(properties))
        myScrollView!.addSubview(button12)
        self.increaseScrollViewContentH()
        
        let button13 = self.myButton(title: "方法", action: #selector(methods))
        myScrollView!.addSubview(button13)
        self.increaseScrollViewContentH()
        
        let button14 = self.myButton(title: "下标", action: #selector(subscripts))
        myScrollView!.addSubview(button14)
        self.increaseScrollViewContentH()
        
        let button15 = self.myButton(title: "继承", action: #selector(inheritance))
        myScrollView!.addSubview(button15)
        self.increaseScrollViewContentH()
        
        let button16 = self.myButton(title: "构造过程", action: #selector(initialization))
        myScrollView!.addSubview(button16)
        self.increaseScrollViewContentH()
        
        let button17 = self.myButton(title: "析造过程", action: #selector(deinitialization))
        myScrollView!.addSubview(button17)
        self.increaseScrollViewContentH()
        
        let button18 = self.myButton(title: "可选链", action: #selector(deinitialization))
        myScrollView!.addSubview(button18)
        self.increaseScrollViewContentH()
        
        let button19 = self.myButton(title: "错误处理", action: #selector(errorHandling))
        myScrollView!.addSubview(button19)
        self.increaseScrollViewContentH()
    }
    
    @objc private func errorHandling() {
        self.navigationController?.pushViewController(ContentVC1(type: .OptionalChaining), animated: true)
    }
    
    @objc private func optionalChaining() {
        self.navigationController?.pushViewController(ContentVC1(type: .OptionalChaining), animated: true)
    }
    
    @objc private func deinitialization() {
        self.navigationController?.pushViewController(ContentVC1(type: .Deinitialization), animated: true)
    }
    
    @objc private func initialization() {
        self.navigationController?.pushViewController(ContentVC1(type: .Initialization), animated: true)
    }
    
    @objc private func inheritance() {
        self.navigationController?.pushViewController(ContentVC1(type: .Inheritance), animated: true)
    }
    
    @objc private func subscripts() {
        self.navigationController?.pushViewController(ContentVC1(type: .Subscripts), animated: true)
    }
    
    @objc private func methods() {
        self.navigationController?.pushViewController(ContentVC1(type: .Methods), animated: true)
    }
    
    @objc private func properties() {
        self.navigationController?.pushViewController(ContentVC1(type: .Properties), animated: true)
    }
    
    @objc private func structuresAndClasses() {
        self.navigationController?.pushViewController(ContentVC1(type: .StructuresAndClasses), animated: true)
    }
    
    @objc private func enumerations() {
        self.navigationController?.pushViewController(ContentVC1(type: .Enumerations), animated: true)
    }
    
    @objc private func closures() {
        self.navigationController?.pushViewController(ContentVC1(type: .Closures), animated: true)
    }
    
    @objc private func functions() {
        self.navigationController?.pushViewController(ContentVC1(type: .Functions), animated: true)
    }
    
    @objc private func controlFlow() {
        self.navigationController?.pushViewController(ContentVC1(type: .ControlFlow), animated: true)
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


