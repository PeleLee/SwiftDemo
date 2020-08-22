//
//  AboutSwiftVC.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/19.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

class AboutSwiftVC: BaseViewController  {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        var note: String = ""
        note += "playgrounds代码预览，在不编译和运行的情况下查看实时结果。\n\n"
        note += "变量始终在使用前初始化。\n\n"
        note += "数组越界监测(还没体验到)。\n\n"
        note += "整数溢出监测(还没体验到)。\n\n"
        note += "可选值明确处理nil值。\n\n"
        note += "内存别自动管理(还没体验到)。\n\n"
        
        let label: UILabel = self.myLabel(title: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
        
    }
    
}
