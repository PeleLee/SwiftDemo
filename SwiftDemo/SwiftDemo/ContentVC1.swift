//
//  ContentVC1.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/19.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

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
        case .TheBasics:
            self.theBasicsNote()
        case .BasicOperator:
            self.basicOperator()
        }
    }
    
    private func basicOperator() {
        var note = ""
        let myLB = self.myLineBreak()
        let notes = [myLB,
                     statementStr1+myLB,
                     "<< 代码在BasicOperator.playground中。"+myLB,
                     "Swift与C语言和OC不同的是，赋值操作不返回任何值。"+myLB,
                     "a%b 与 a%-bd 的结果是相通的。"+myLB,
                     "一元正号(+)可以配合一元负号(-)使用，代码会具有对称美。"+myLB,
                     "Swift的恒等(===)与不恒等(!==)比较符。"+myLB,
                     "元组元素相同且长度(七个以内)相同时，可以被比较，超长需要自己实现比较符。存在布尔类型的元组不能被比较。"+myLB,
                     "空合运算符(??)"+myLB,
                     "闭区间运算符(a...b)，半开区间运算符(a..<b)."+myLB,
                     "半开区间(..b或..<b)，可以用作数组下标。",
                     "可以使用半开区间初始化Range对象，并检查是否包含某个特定值。"+myLB,
                     myLB]
        
        for noteItem in notes {
            note += noteItem
        }
        
        let label = self.myLabel(title: note)
        self.changeLabelHeight(label: label, text: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func theBasicsNote() {
        var note: String = ""
        let myLB = self.myLineBreak()
        let notes: [String] = [myLB,
                               statementStr1+myLB,
                               "<< 代码在TheBasicsPlayground.playground中"+myLB,
                               "Tuple(元组)是Swift新增的高阶数据类型。可以创建或者传递一组数据。"+myLB,
                               "Swift是一门类型安全的语言。有助于开发阶段尽早发现问题并修复。"+myLB,
                               "类型注释。"+myLB,
                               "可以在一行声明多个常量和变量，在最后一个变量名后添加类型注释。"+myLB,
                               "类型推断。"+myLB,
                               "使用Swift关键字做变量名的方法,用到反引号。尽量避免使用。"+myLB,
                               "print(_:separator:terminator:)是一个全局函数。.playground中有高级用法代码。"+myLB,
                               "打印时的字符串插值，使用反斜杠转义。"+myLB,
                               "多行注释可以包含其他的多行注释，这是比OC好的地方。"+myLB,
                               "分号可以用来在同一行写多个独立的语句。"+myLB,
                               "Int(UInt)类型长度与当前平台原生字长[Int32(UInt32)或Int64(UInt64)]相同。"+myLB,
                               "尽量不要使用UInt，即使要存储的值已知是非负的。统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断。"+myLB,
                               "16进制的指数形式，相当于基数和2^e的乘积"+myLB,
                               "数值类字面量可以添加额外的0和_"+myLB,
                               "整数转换，SomeType(value)方法是调用Swift构造器，可以扩展现有类型"+myLB,
                               "类型别名typealias"+myLB,
                               "元组的内容分解等常见用法"+myLB,
                               "元组可以对简单的数据进行分组，但不适合创建复杂的数据类型，此时可用类或结构体代替。"+myLB,
                               "OC只有对象可以使用nil，Swift所有可选类型都可以设置为nil."+myLB,
                               "确保可选值不为nil后，可使用 ! 来强制解析。"+myLB,
                               "if let 或 if var 叫做可选绑定。"+myLB,
                               "可选绑定可以包含多个条件。"+myLB,
                               "没太懂隐式可选解析类型的作用，查了下貌似可以用来在类中解决循环引用问题。"+myLB,
                               "断言在开发阶段找到错误和不正确的假设，先决条件可以在生产环境中探测到存在的问题，断言在生产环境不会产生任何影响。"+myLB,
                               "先决条件 precondition()全局函数。"+myLB,
                               "unchecked模式编译代码，断言和先决条件会被优化点，fatalError()函数不会被优化点。"+myLB
        ]
        for noteItem in notes {
            note += noteItem
        }
        
        let label = self.myLabel(title: note)
        self.changeLabelHeight(label: label, text: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func swiftTourNote() -> Void {
        var note: String = self.myLineBreak()
        let myLB = self.myLineBreak()
        note += statementStr1+myLB
        note += "<< 代码在ContentVC1.playground文件中。"+myLB
        
        let label = self.myLabel(title: note)
        self.changeLabelHeight(label: label, text: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func aboutSwiftNote() {
        var note: String = self.myLineBreak()
        note += statementStr1+self.myLineBreak()
        note += "playgrounds代码预览，在不编译和运行的情况下查看实时结果。\n\n"
        note += "变量始终在使用前初始化。\n\n"
        note += "数组越界监测(还没体验到)。\n\n"
        note += "整数溢出监测(还没体验到)。\n\n"
        note += "可选值明确处理nil值。\n\n"
        note += "内存别自动管理(还没体验到)。\n\n"
        
        let label: UILabel = self.myLabel(title: note)
        self.changeLabelHeight(label: label, text: note)
        self.myScrollView?.addSubview(label)
        self.increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    func myLineBreak() -> String {
        return "\n\n"
    }
    
}
