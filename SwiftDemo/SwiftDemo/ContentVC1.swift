//
//  ContentVC1.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/19.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

enum ChapterType {
    case AboutSwift
    case SwiftTour
}

class ContentVC1: BaseViewController  {
    
    var type: ChapterType = .AboutSwift
    
    init(type: ChapterType) {
        super.init(nibName: nil, bundle: nil)
        self.type = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        switch type {
        case .AboutSwift:
            self.aboutSwiftNote()
        case .SwiftTour:
            self.swiftTourNote()
        }
        
    }
    
    private func swiftTourNote() -> Void {
        var note: String = ""
        let myLB = self.myLineBreak()
        note += "代码在playground文件中"+myLB
        
        let label = self.myLabel(title: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func aboutSwiftNote() {
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
    
    func myLineBreak() -> String {
        return "\n\n"
    }
    
}
