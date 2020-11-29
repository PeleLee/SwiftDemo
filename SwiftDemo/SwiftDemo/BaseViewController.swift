//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/20.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

enum ChapterType {
    case AboutSwift // 关于Swift
    case SwiftTour // Swift初见
    case TheBasics // 基础部分
    case BasicOperator // 基本运算符
    case StringsAndCharacters // 字符串和字符
    case CollectionTypes // 集合类型
    case ControlFlow // 控制流
    case Functions // 函数
    case Closures // 闭包
    case Enumerations // 枚举
    case StructuresAndClasses // 类和结构体
    case Properties // 属性
    case Methods // 方法
    case Subscripts // 下标
    case Inheritance // 继承
    case Initialization // 构造过程
    case Deinitialization // 析构过程
    case OptionalChaining // 可选链
}

class BaseViewController: UIViewController {

    var myScrollView: UIScrollView?
    let scrollX: CGFloat = 20
    var scrollW: CGFloat = 0
    
    
    var contentHeight: CGFloat = 0
    
    let verSpace: CGFloat = 20
    /// 通用按钮高度
    let rButtonH: CGFloat = 44
    let buttonX: CGFloat = 20
    var buttonW: CGFloat = 0
    
    let statementStr1 = "仅为我个人认为需要做的笔记。"
    let separatorStr1 = "\n---------------------------------"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentHeight += verSpace
        self.initMyScrollView()
    }
    
    //MARK:- ScrollView
    private func initMyScrollView() {
        
        var stateH: CGFloat = 0
        if #available(iOS 13.0, *) {
            stateH = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
        else {
            stateH = UIApplication.shared.statusBarFrame.size.height
        }
        let navH: CGFloat = navigationController?.navigationBar.frame.height ?? 0
        let scrollX: CGFloat = 20
        scrollW = (UIScreen.main.bounds.width - scrollX*2)
        let scrollBottom: CGFloat = 34
        let scrollY: CGFloat = stateH + navH + 10
        let scrollH: CGFloat = view.bounds.height - scrollY - scrollBottom
        let scrollRect: CGRect = CGRect.init(x: scrollX, y: scrollY, width: scrollW, height: scrollH)
        buttonW = scrollW - buttonX*2
        
        myScrollView = UIScrollView.init(frame: scrollRect)
        myScrollView?.backgroundColor = UIColor.init(red: 0.984, green: 0.447, blue: 0.6, alpha: 0.1)
        
        view.addSubview(myScrollView!)
        
    }
    
    func increaseScrollViewContentH() {
        contentHeight += (verSpace + rButtonH)
        self.myScrollView?.contentSize = CGSize.init(width: scrollW, height: contentHeight)
    }
    
    func increaseCustomScrollViewContentH(customH: CGFloat) {
        contentHeight += (verSpace + customH)
        self.myScrollView?.contentSize = CGSize.init(width: scrollW, height: contentHeight)
    }
    
    //MARK:- Button
    func myButton(title: String, action: Selector) -> UIButton {
        
        let btn: UIButton = UIButton.init(type: .system)
        btn.setTitle(title, for: .normal)
        btn.frame = CGRect.init(x: self.buttonX, y: contentHeight, width: buttonW, height: rButtonH)
        btn.addTarget(self, action: action, for: .touchUpInside)
        let titleColor = UIColor.init(red: 0.125, green: 0.667, blue: 0.886, alpha: 1)
        btn.setTitleColor(titleColor, for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .left
        btn.backgroundColor = .white
        return btn
        
    }
    
    //MARK:- Label
    func myLabel(title: String) -> UILabel {
        
        let label: UILabel = UILabel.init(frame: CGRect.init(x: buttonX, y: contentHeight, width: buttonW, height: 0))
        label.text = title
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.backgroundColor = .init(red: 249/255.0, green: 213/255.0, blue: 86/255.0, alpha: 0.2)
        label.font = .systemFont(ofSize: 14)
        return label
        
    }
    
    func changeLabelHeight(label: UILabel, text: String) {
        let ocText: NSString = text as NSString
        let size = CGSize(width: label.frame.width, height: CGFloat(Int.max))
        let dic = NSDictionary(object: label.font as Any, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = ocText.boundingRect(with: size,
                                             options: .usesLineFragmentOrigin,
                                             attributes: dic as? [NSAttributedString.Key:Any],
                                             context: nil)
        var labelFrame = label.frame
        labelFrame.size.height = stringSize.height
        label.frame = labelFrame
    }
}
