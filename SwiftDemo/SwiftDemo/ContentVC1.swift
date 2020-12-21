//
//  ContentVC1.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/19.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

class ContentVC1: BaseViewController {
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
        view.backgroundColor = .white

        switch type {
        case .AboutSwift:
            aboutSwiftNote()
        case .SwiftTour:
            swiftTourNote()
        case .TheBasics:
            theBasicsNote()
        case .BasicOperator:
            basicOperator()
        case .StringsAndCharacters:
            stringsAndCharcters()
        case .CollectionTypes:
            collectionTypes()
        case .ControlFlow:
            controlFlow()
        case .Functions:
            functions()
        case .Closures:
            closures()
        case .Enumerations:
            enumerations()
        case .StructuresAndClasses:
            structuresAndClasses()
        case .Properties:
            properties()
        case .Methods:
            methods()
        case .Subscripts:
            subscripts()
        case .Inheritance:
            inheritance()
        case .Initialization:
            initialization()
        case .Deinitialization:
            deInitialization()
        case .OptionalChaining:
            optionalChaining()
        case .ErrorHandling:
            errorHandling()
        case .TypeCasting:
            typeCasting()
        case .NestedTypes:
            nestedTypes()
        case .Extensions:
            extensions()
        case .Protocols:
            protocols()
        }
    }
    
    private func protocols() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在 Protocols.playground 中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func extensions() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在 Extensions.playground 中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func nestedTypes() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在 NestedTypes.playground 中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func typeCasting() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在 TypeCasting.playground 中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func errorHandling() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在ErrorHandling.playground中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func optionalChaining() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在OptionalChaining.playground中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func deInitialization() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在DeInitialization.playground中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }
    
    private func initialization() {
        var note = ""
        let myLB = myLineBreak()
        // let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "内容整理在 Swift.xmind中",
                     separatorStr1 + myLB,
                     "代码在Initialization.playground中",
                     separatorStr1 + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func inheritance() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1,
                     separatorStr1 + myLB,
                     "子类可以调用和访问父类的：" + myLB,
                     " * 方法" + mySingleLB,
                     " * 属性" + mySingleLB,
                     " * 下标",
                     separatorStr1 + myLB,
                     "子类中的属性：" + myLB,
                     "可以添加属性观察器，无论是存储型属性还是计算型属性。",
                     separatorStr1 + myLB,
                     "Swift超类与OC超类的区别：" + myLB,
                     "Swift中的类不是从一个通用的基类继承而来的，如果你不为自己定义的类指定一个超类的话，这个类就会自动成为基类。",
                     separatorStr1 + myLB,
                     "重写：" + myLB,
                     "* 关键字：override" + mySingleLB,
                     "* 可重写：实例方法、类方法、实例属性、类属性、下标",
                     separatorStr1 + myLB,
                     "防止重写：" + myLB,
                     "* 关键字：final" + mySingleLB,
                     "* 可修饰 var、func、class、subscript 等" + mySingleLB,
                     "* 可修饰 class，表明类不可以被继承" + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func subscripts() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "代码在Subscripts.playground中" + myLB,
                     "下标的作用：" + mySingleLB,
                     "访问集合、列表和序列中元素的快捷方式。" + myLB,
                     "下标定义的场景：" + mySingleLB,
                     "* 类" + mySingleLB,
                     "* 结构体" + mySingleLB,
                     "* 枚举" + myLB,
                     "关键字：" + mySingleLB,
                     "subscript" + myLB,
                     "与实例方法的对比：" + myLB,
                     "相同点：" + mySingleLB,
                     "* 传入一个或者多个输入参数和一个返回类型。" + myLB,
                     "不同点：" + mySingleLB,
                     "* 下标可以设定为读写或只读。由getter和setter实现，类似计算型属性。" + myLB,
                     "有一套完整的写法，也有省略set方法和省略get关键字的简化写法，简化规则可以到教程中回顾。",
                     separatorStr1 + myLB,
                     "下标参数：" + myLB,
                     "* 可以使用可变参数。" + mySingleLB,
                     "* 不可以使用in-out参数。" + mySingleLB,
                     "* 不能提供默认参数。" + mySingleLB,
                     separatorStr1 + myLB,
                     "下标的重载：" + myLB,
                     "一个类或结构体可以根据自身需要提供多个下标实现，使用时将通过入参的数量和类型进行区分，自动匹配合适的下标。",
                     separatorStr1 + myLB,
                     "实例下标与类型下标：" + myLB,
                     "* 分别在特定类型的实例上调用和在特定类型子身上调用。" + mySingleLB,
                     "* 在subscript关键字前 + static 表示类型下标。" + mySingleLB,
                     "* 使用class代替static，允许子类重写父类对该下标的实现。",
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func methods() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "代码在Methods.playground中。" + myLB,
                     "实例方法与类型方法存在场景：" + mySingleLB,
                     "* 类" + mySingleLB,
                     "* 结构体" + mySingleLB,
                     "* 枚举" + mySingleLB,
                     "结构体和枚举能够定义方法是Swift与C/OC的主要区别之一。" + myLB,
                     "不必在代码里经常写self，只要在一个方法中使用一个已知的属性或者方法名称，如果没有明确写self，Swift假定你是指当前实例的属性或者方法。" + mySingleLB,
                     "实例方法的某个参数名称与实例的某个属性名称相同时，可以使用self属性来消除歧义。" + myLB,
                     "mutating关键字：表明可以在值类型的实例方法中修改属性值。" + mySingleLB,
                     "可变方法（mutating修饰的）会给隐含的self属性赋予一个全新的实例，新实例在方法结束时会替换现存实例。" + mySingleLB,
                     "也可以在可变方法中显式给self赋值。" + mySingleLB,
                     "枚举的可变方法可以把self设置为同一枚举类型中不同的成员。" + myLB,
                     "类型方法的关键字：" + mySingleLB,
                     "* static：类、结构体、枚举中，加在func前表示类型方法。" + mySingleLB,
                     "* class：类中，表示该类型方法可以被子类重写。" + myLB,
                     "类型方法中，self指向这个类型本身，可以用self来消除类型属性和类型方法参数之间的歧义。" + myLB,
                     "@discardableResult标注，声明可忽略返回值。" + myLB,
        ]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func properties() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "代码在Properties.playground中" + myLB,
                     "属性存在的场景：" + mySingleLB,
                     "* 类" + mySingleLB,
                     "* 结构体" + mySingleLB,
                     "* 枚举" + myLB,
                     "计算属性与存储属性的区别：是直接计算而不是存储值。" + mySingleLB,
                     "存储属性存在的地方：" + mySingleLB,
                     "* 类" + mySingleLB,
                     "* 结构体" + mySingleLB,
                     "计算属性存在的地方：" + mySingleLB,
                     "* 类" + mySingleLB,
                     "* 结构体" + mySingleLB,
                     "* 枚举" + myLB,
                     "类型属性：直接与类型本身关联，而不是和特定类型的实例关联。" + myLB,
                     "常量(let)结构体实例的存储属性：" + mySingleLB,
                     "即使存储属性是变量，也无法修改，因为结构体属于值类型，实例为常量时，所有的属性也就成了常量。" + myLB,
                     "lazy:延时加载var类型的存储属性。" + myLB,
                     "只读计算属性：只有getter没有setter。" + mySingleLB,
                     "必须使用var关键字修饰，因为值时不固定的。注意区分与用let修饰的属性的区别。" + myLB,
                     "willSet和didSet：属性观察器。" + mySingleLB,
                     "在属性观察器中修改改属性的值，不会造成属性观察器被再次调用。" + myLB,
                     "@propertyWrapper：属性包装器，在管理属性如何存储和定义属性的代码之间添加了一个分隔层，编写一次管理代码，然后应用到多个属性上来进行复用。" + mySingleLB,
                     "通过为属性包装器添加带实参的构造器方法，来提供初始化被包装属性的初始值。有多种调用构造器的方法，可在playground中查看。" + myLB,
                     "可以从属性包装器中呈现一个值，使用projectedValue变量名表示被暴露出的值，访问该值时用$来访问。" + mySingleLB,
                     "当在属性内部访问包装器的被呈现值时，可以省略(self.)，与访问其他属性没有差别。" + myLB,
                     "属性包装器只是具有getter和setter的属性的语法糖。" + myLB,
                     "全局变量和常量都是延迟计算，并且不需要标记lazy修饰符。局部常量或变量从不延迟计算。" + myLB,
                     "static，定义类型属性，调用时用类型本身来访问，而不是通过实例。" + mySingleLB,
                     "class来替换static，表示支持子类对父类的(类型属性)进行重写。" + myLB,
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func structuresAndClasses() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "代码在StructuresAndClasses.playground中。" + myLB,
                     "Swift中结构体和类的功能更加相近，大部分功能都可以用在结构体或者类上。" + mySingleLB,
                     "结构体和类都可以用实例这个术语。" + myLB,
                     "类的功能更多，但是以增加复杂度为代价的，优先使用结构体，因为他们更容易理解。" + mySingleLB,
                     "类附加的功能：" + mySingleLB,
                     "* 允许继承。" + mySingleLB,
                     "* 检查和解释一个类实例的类型。" + mySingleLB,
                     "* 析构器允许类实例释放所有被分配的资源。" + mySingleLB,
                     "* 引用计数允许对类多次引用。" + mySingleLB,
                     "结构体都有一个自动生成的成员逐一构造器方法，可以为各个属性设置初始值。" + myLB,
                     "结构体和枚举都是值类型。" + mySingleLB,
                     "integer、boolean、string、array等都是值类型，底层也是使用结构体实现的。" + myLB,
                     "系统都对标准库中集合的复制进行了优化：" + mySingleLB,
                     "新集合不会被立即复制，而是跟原集合共享一份内存，在集合的某个副本要被修改前，才会真正复制。" + mySingleLB,
                     "包括数组、字典和字符串。" + myLB,
                     "类是引用类型。" + mySingleLB,
                     "可以使用恒等运算符：相同（===）、不相同（！==）来判定两个常量或变量是否引用同一个类实例。" + myLB,
                     "相同（===）与等于（==）的区别：" + mySingleLB,
                     "* === 表示两个类类型的常量与变量引用同一个类实例。" + mySingleLB,
                     "* == 表示两个实例的值相等或等价。",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func enumerations() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码Enumerations.playground中。" + myLB,
                     "枚举默认没有整型的原始值，有的话可以是字符串、字符或是整型值或浮点数。" + mySingleLB,
                     "枚举成员可以指定任意类型的关联值，像其他语言的联合体和变体。" + myLB,
                     "枚举是一等类型，采用了很多只有被类所支持的特性。如计算属性、实例方法、构造函数、遵守协议等" + mySingleLB,
                     "枚举成员本身就是完备的值，不一定是其他语言默认的整型值。" + myLB,
                     "枚举遵守CaseIterable协议，可以生成包含所有枚举成员的集合。" + myLB,
                     "switch搭配枚举使用。" + mySingleLB,
                     "值绑定的简便方法：多个常量或变量时，可以只写一个let或var." + myLB,
                     "枚举的原始值：" + mySingleLB,
                     "原始值可以是字符串、字符，或者任意整型值或浮点型值。" + mySingleLB,
                     "定义原始值类型的语法，如enum ASCIIControlCharacter: Character {}" + mySingleLB,
                     "与关联值的不同：原始值始终不变，关联值可以变化。" + myLB,
                     "枚举的隐式赋值。" + mySingleLB,
                     "--条件：当原始值类型为整数或者字符串类型时。" + mySingleLB,
                     "整数类型隐式原始值默认从0开始，字符串类型的隐式原始值为该枚举成员的名称。" + mySingleLB,
                     "rawValue:使用原始值初始化枚举实例，是一个可失败的构造器，实例也是可选类型。" + myLB,
                     "indirect声明嵌套枚举。",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func closures() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码Closures.playground中。" + myLB,
                     "闭包与函数的关系：" + mySingleLB,
                     "* 全局函数是有名字但不会捕获任何值的闭包。" + mySingleLB,
                     "* 嵌套函数是有名字并可以捕获函数域内值的闭包。" + mySingleLB,
                     "* 闭包表达式是可以捕获上下文值的匿名闭包。" + myLB,
                     "闭包表达式注意点：" + mySingleLB,
                     "* 参数可以是in-out参数。" + mySingleLB,
                     "* 参数不能设置默认值。" + mySingleLB,
                     "* 参数可以是可变参数。" + mySingleLB,
                     "* 参数和返回值都可以为元组。" + myLB,
                     "闭包表达式是为了简化函数参数的声明，语法格式要记清楚。" + myLB,
                     "闭包函数体(in后面的内容)只有一行时，可以把整个闭包收缩为一行。" + myLB,
                     "内联闭包总能根据上下文推断出参数和返回值类型，可以省略类型声明。" + mySingleLB,
                     "但是也可以声明类型，仍然可以写出有完整格式的闭包，可以提高代码可读性。" + myLB,
                     "闭包函数体为一行时，支持隐式返回，可以省略reture关键字。" + myLB,
                     "闭包参数名称缩写，省略参数列表声明和in关键字。" + myLB,
                     "运算符方法，当闭包接受两个同类型参数并返回Bool类型值时，可用'>'或'<'达到最简形式。" + myLB,
                     "尾随闭包：当闭包非常长以至于不能在一行中进行书写时使用。" + mySingleLB,
                     "可以优雅地在函数后封装闭包的具体功能，而不需要将整个闭包包含在方法调用的括号中。" + mySingleLB,
                     "函数支持将其作为最后一个参数调用。" + mySingleLB,
                     "函数只有一个尾随闭包参数时，可以把函数调用的括号去掉。" + myLB,
                     "闭包的值捕获，可以在被定义的上下文中捕获常量或变量，即使原作用域已经不存在。" + mySingleLB,
                     "可以捕获值的闭包的最简单形式是嵌套函数。" + myLB,
                     "闭包是引用类型，将闭包赋值给两个不同的常量或变量，两个值都会指向同一个闭包。" + myLB,
                     "逃逸闭包：函数返回后才被执行，称该闭包从函数中逃逸。" + mySingleLB,
                     "使用@escaping关键字声明。" + mySingleLB,
                     "与非逃逸闭包相比，必须显式引用self." + myLB,
                     "自动闭包：" + mySingleLB,
                     "* 用于包装传递给函数作为参数的表达式。" + mySingleLB,
                     "* 不接受任何参数。" + mySingleLB,
                     "* 实现延时求值，调用闭包时代码才会执行，方便控制代码执行时机。" + mySingleLB,
                     "* @autoclosure 属性，会将参数自动转化为一个闭包，不需要显示声明。" + mySingleLB,
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func functions() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码在Functions.playground中。" + myLB,
                     "函数参数可以提供默认值，以简化函数调用。" + myLB,
                     "函数都有类型，可以当普通变量类型一样处理。" + myLB,
                     "严格地说，即使函数没有返回值，它仍然返回一个Void类型特殊值，该值为一个空元组，写成()" + myLB,
                     "函数返回值为元组时，可以为元组每个元素命名，方便后续使用。" + mySingleLB,
                     "整个元组可能没有值时，可以使用可选的元组类型作为函数返回值。" + myLB,
                     "函数的隐式返回，函数体（大括号内）是单行表达式时，可以省略reture." + myLB,
                     "函数的参数标签和参数名称，如 func greeting(for person: String)." + mySingleLB,
                     "for是参数标签，person是参数名称。" + mySingleLB,
                     "参数标签在调用函数时使用，参数名称在函数的实现中使用。" + mySingleLB,
                     "默认以参数名称作为参数标签。" + myLB,
                     "参数标签可以让函数更有表达力，更类似自然语言，仍能保持函数内部的可读性以及清晰的意图。" + mySingleLB,
                     "如func greet(person: String, from hometown: String) -> String函数。" + myLB,
                     "使用_来忽略参数标签。忽略后参数名称也不能当作参数标签来使用。" + myLB,
                     "可以给函数参数设置默认值，将带有默认值的参数放在最后面是官方建议的做法，但也可以放前面。" + myLB,
                     "可变参数，在类型后面加上(...)的方式来实现，如func arithmeticMean(_ numbers: Double...)," + mySingleLB,
                     "每个函数最多只能有一个可变参数。" + myLB,
                     "输入输出参数(inout修饰)，是函数对函数体外产生影响的一种方式。" + mySingleLB,
                     "几个条件:" + mySingleLB,
                     "* 传入的inout参数值必须是变量。" + mySingleLB,
                     "* inout参数不能有默认值。" + mySingleLB,
                     "* 可变参数不能用inout修饰。" + myLB,
                     "函数类型:由函数参数类型和返回值类型决定，与函数名称和函数体内逻辑没关系。" + myLB,
                     "可以像使用其他类型一样使用函数类型，当作常量和变量。" + myLB,
                     "可以把函数类型当作函数参数类型，这样就以一种类型安全的方式将一部分功能转给调用者实现。" + myLB,
                     "函数类型可以作为函数返回值。" + myLB,
                     "嵌套函数是定义在函数内部的局部函数，与其他的全局函数要区分清楚。",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func controlFlow() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码在ControlFlow.playground中。" + myLB,
                     "Swift控制流：while、if、guard、switch、for-in。" + mySingleLB,
                     "switch特别强大，可以匹配很多模式，包括范围匹配，元组和特定类型匹配，或配合where描述更复杂的匹配" + myLB,
                     "可在for-in中使用stride方法实现跳过。" + myLB,
                     "while用在迭代次数位置的情况下，比如蛇和梯子的游戏。" + mySingleLB,
                     "repeat-while循环在代码块结束时判断条件，whil在循环开始时判断条件。" + myLB,
                     "if语句的else语句是可选的，在不需要完整判断情况的时候可省略。可以是不完备的。" + myLB,
                     "switch语句必须上完备的，需要涵盖所有值的情况。" + myLB,
                     "switch不存在隐式贯穿，不需要写break。" + mySingleLB,
                     "可以显示贯穿case分支，使用fallthrough语句。" + mySingleLB,
                     "每个case分支必须包含至少一条语句。两种条件匹配同一个情况时，需要用逗号并列条件，与C和OC不同。" + myLB,
                     "switch case分支的高级匹配模式:" + mySingleLB,
                     "--匹配区间。如case 5..<12:" + mySingleLB,
                     "--元组匹配。使用_来匹配所有可能的值，如(_, 0)。可以搭配区间使用，如(-2...2, -2...2)。" + mySingleLB,
                     "--值绑定。如(let x, 0)、let (x, y)等。" + mySingleLB,
                     "--Where来判断额外的条件，搭配值绑定使用。如 let (x, y) where x == y:" + mySingleLB,
                     "--复合型Cases。使用,分隔多种case，case过多时可以换行。也可以搭配值绑定使用。" + myLB,
                     "switch分支中使用break，被匹配到时会立即结束switch语句。" + myLB,
                     "switch中使用fallthrough关键字可以达到C语言switch语句的效果" + myLB,
                     "带标签的语句，可以在复杂的控制流结构中（包含多个控制流），显示指明语句影响的是哪一个控制流。" + myLB,
                     "guard语句，可以提升代码可读性，使代码连贯的被执行而不需要将它包在else块中。" + myLB,
                     "#available(平台名称 版本号, ... , *)语句，是swift内置的，可以检查API可用性。",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func collectionTypes() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码在CollectionTypes.playground中。" + myLB,
                     "集合类型：数组 Array、集合 Set、字典 Dictionary，均为泛型集合，只有数组是有序的。" + myLB,
                     "Array被桥接到NSArray类。" + myLB,
                     "Array(repeating:count)方法创建带重复元素的数组。" + mySingleLB,
                     "isEmpty检查数组是否为空。" + mySingleLB,
                     "使用下标Range批量修改数组元素。" + mySingleLB,
                     "使用removeFirst()和removeLast()快速删除顶端元素。" + mySingleLB,
                     "使用enumerated()方法来遍历数组。" + myLB,
                     "集合(Sets)，集合顺序不重要或者希望每个元素只出现一次时使用。" + mySingleLB,
                     "Set类型被桥接到NSSet类。" + mySingleLB,
                     "可哈希化的类型才能被存储在集合中，遵守Hashable、Equatable协议。" + myLB,
                     "集合的sorted()方法返回一个数组，是有序的，可以通过闭包来控制顺序和倒序。" + myLB,
                     "两个集合之间的几种操作" + myLB,
                     "两个集合的成员关系判断，相等关系，包含关系，交集，严格包含等。" + myLB,
                     "Swift的Dictionary类型被桥接到Foundatin的NSDictionary类。" + mySingleLB,
                     "字典的Key类型必须遵守Hashable协议。" + myLB,
                     "字典的updateValue(_:forKey:)方法可以返回旧值。" + myLB,
                     "字典的keys和values都不是集合，也不是数组，需要强转一下。",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func stringsAndCharcters() {
        var note = ""
        let myLB = myLineBreak()
        let mySingleLB = mySingleLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码在StringsAndCharacters.playground中。" + myLB,
                     "Swift的String类与OC的NSString类可以无缝桥接。" + myLB,
                     "多行字符串字面量：" + mySingleLB,
                     "使用\"\"\"来声明多行字符串字面量。" + mySingleLB,
                     "这两个位置：\"开启引号\"之后和\"结束引号\"之前，都没有换行符号，其他位置的换行符是真实的。" + mySingleLB,
                     "续行符：不想出现换行符的话，可以在行尾加一个\\作为续行符。" + mySingleLB,
                     "多行字符串字面量缩进：\"结束引号\"前的空白字符串需要被忽略，超过部分就是缩进。" + myLB,
                     "特殊字符：" + mySingleLB,
                     "可以使用\\u{位码}来表示Unicode标量。" + mySingleLB,
                     "多行中n(从单引号到超过三引号)个引号的使用。" + myLB,
                     "去除字符串转移功能：使用前后#(可以有多个，但要保证前后对称)包裹原有字符串。" + mySingleLB,
                     "使其中的部分转移符生效，可以通过在在\\后添加相同数量的#来实现。" + myLB,
                     "字符串是值类型，深拷贝。" + myLB,
                     "可以通过字符或者字符数组初始化字符串。" + myLB,
                     "Swift的Character，代表一个可扩展的字形群。同一个字符，可能包含不止一个标量。" + mySingleLB,
                     "可以用包围记号(\\u{20DD})包围其他Unicode标量，形成一个单一的Character值。" + myLB,
                     "count方法计算字符串中的字符数量，测试汉字和旗帜都只占一个字符长度。与OC的length结果不一致。" + mySingleLB,
                     "在字符串后添加一个标量，如果更改了最后一个字符值，就不会增加字符串字符数量。" + myLB,
                     "字符串索引 index，不能用整数做索引。" + mySingleLB,
                     "索引的各种便利方法。也可以在任意一个确认的并遵守Collection协议的类型中使用，如Array、Dictionary等。" + mySingleLB,
                     "使用indices属性可以创建一个包含全部索引的Range." + myLB,
                     "使用insert插入单个字符和一个字符串的区别。" + mySingleLB,
                     "使用remove删除单个字符和字符串的区别。" + mySingleLB,
                     "这些方法也可以在任意一个确认的并遵守RangeReplaceableCollection协议的类型中使用。" + mySingleLB,
                     "注意要求遵守的协议和index方法要求的协议不一样。" + myLB,
                     "SubString与String的区别在于性能优化上，SubString可以重用原String的内存空间。" + mySingleLB,
                     "可以配合官方的图解来理解。" + mySingleLB,
                     "StringProtocol协议，操作字符串的函数可以使用协议表示参数会更加方便，兼容String与SubString." + myLB,
                     "两个字符串相等的标准：可扩展的字形群集有相同的语言意义和外观，即标准相等。" + mySingleLB,
                     "有些字符外观相同但语义不同，两者不相等。比如英文A和俄文A。" + myLB,
                     "字符串的Unicode形式。" + mySingleLB,
                     "UTF-8、UTF-16和UTF-32的区别，32需要使用scalar.value.",
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func basicOperator() {
        var note = ""
        let myLB = myLineBreak()
        let notes = [myLB,
                     statementStr1 + myLB,
                     "<< 代码在BasicOperator.playground中。" + myLB,
                     "Swift与C语言和OC不同的是，赋值操作不返回任何值。" + myLB,
                     "a%b 与 a%-bd 的结果是相通的。" + myLB,
                     "一元正号(+)可以配合一元负号(-)使用，代码会具有对称美。" + myLB,
                     "Swift的恒等(===)与不恒等(!==)比较符。" + myLB,
                     "元组元素相同且长度(七个以内)相同时，可以被比较，超长需要自己实现比较符。存在布尔类型的元组不能被比较。" + myLB,
                     "空合运算符(??)" + myLB,
                     "闭区间运算符(a...b)，半开区间运算符(a..<b)." + myLB,
                     "半开区间(..b或..<b)，可以用作数组下标。",
                     "可以使用半开区间初始化Range对象，并检查是否包含某个特定值。" + myLB,
                     myLB]

        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func theBasicsNote() {
        var note: String = ""
        let myLB = myLineBreak()
        let notes: [String] = [myLB,
                               statementStr1 + myLB,
                               "<< 代码在TheBasicsPlayground.playground中" + myLB,
                               "Tuple(元组)是Swift新增的高阶数据类型。可以创建或者传递一组数据。" + myLB,
                               "Swift是一门类型安全的语言。有助于开发阶段尽早发现问题并修复。" + myLB,
                               "类型注释。" + myLB,
                               "可以在一行声明多个常量和变量，在最后一个变量名后添加类型注释。" + myLB,
                               "类型推断。" + myLB,
                               "使用Swift关键字做变量名的方法,用到反引号。尽量避免使用。" + myLB,
                               "print(_:separator:terminator:)是一个全局函数。.playground中有高级用法代码。" + myLB,
                               "打印时的字符串插值，使用反斜杠转义。" + myLB,
                               "多行注释可以包含其他的多行注释，这是比OC好的地方。" + myLB,
                               "分号可以用来在同一行写多个独立的语句。" + myLB,
                               "Int(UInt)类型长度与当前平台原生字长[Int32(UInt32)或Int64(UInt64)]相同。" + myLB,
                               "尽量不要使用UInt，即使要存储的值已知是非负的。统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断。" + myLB,
                               "16进制的指数形式，相当于基数和2^e的乘积" + myLB,
                               "数值类字面量可以添加额外的0和_" + myLB,
                               "整数转换，SomeType(value)方法是调用Swift构造器，可以扩展现有类型" + myLB,
                               "类型别名typealias" + myLB,
                               "元组的内容分解等常见用法" + myLB,
                               "元组可以对简单的数据进行分组，但不适合创建复杂的数据类型，此时可用类或结构体代替。" + myLB,
                               "OC只有对象可以使用nil，Swift所有可选类型都可以设置为nil." + myLB,
                               "确保可选值不为nil后，可使用 ! 来强制解析。" + myLB,
                               "if let 或 if var 叫做可选绑定。" + myLB,
                               "可选绑定可以包含多个条件。" + myLB,
                               "没太懂隐式可选解析类型的作用，查了下貌似可以用来在类中解决循环引用问题。" + myLB,
                               "断言在开发阶段找到错误和不正确的假设，先决条件可以在生产环境中探测到存在的问题，断言在生产环境不会产生任何影响。" + myLB,
                               "先决条件 precondition()全局函数。" + myLB,
                               "unchecked模式编译代码，断言和先决条件会被优化点，fatalError()函数不会被优化点。" + myLB,
        ]
        for noteItem in notes {
            note += noteItem
        }

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func swiftTourNote() {
        var note: String = myLineBreak()
        let myLB = myLineBreak()
        note += statementStr1 + myLB
        note += "<< 代码在ContentVC1.playground文件中。" + myLB

        let label = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    private func aboutSwiftNote() {
        var note: String = myLineBreak()
        note += statementStr1 + myLineBreak()
        note += "playgrounds代码预览，在不编译和运行的情况下查看实时结果。\n\n"
        note += "变量始终在使用前初始化。\n\n"
        note += "数组越界监测(还没体验到)。\n\n"
        note += "整数溢出监测(还没体验到)。\n\n"
        note += "可选值明确处理nil值。\n\n"
        note += "内存别自动管理(还没体验到)。\n\n"

        let label: UILabel = myLabel(title: note)
        changeLabelHeight(label: label, text: note)
        myScrollView?.addSubview(label)
        increaseCustomScrollViewContentH(customH: label.frame.height)
    }

    func myLineBreak() -> String {
        return "\n\n"
    }

    func mySingleLineBreak() -> String {
        return "\n"
    }
}
