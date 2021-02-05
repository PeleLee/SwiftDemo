import UIKit
import PhotosUI

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("多行字符串字面量")

// """ 最近的回车或换行会被忽略
let mutiStr0 = """
多行字符串
"""

// 2
myPrint("多行字符串字面量缩进")

let mutiStr1 = """

    多行字符串0
        多行字符串1
            多行字符串2
"""
print(mutiStr1)

let mutiStr2 = """

    多行字符串0
        多行字符串1
            多行字符串2
    """
print(mutiStr2)

// 会报错
/*
let mutiStr3 = """

    多行字符串0
        多行字符串1
            多行字符串2
        """
*/

// 3
myPrint("多行字符串字面量省略中断")

let mutiStr4 = """
只有一\
行哦
"""

// 4
myPrint("特殊字符转化为普通字符显示")

let str0 = #"\(x) \ " \u{2603}"#
let str1 = "\\(x) \\ \" \\u{2603}"

print(str0 == str1)

// 5

print("Line 1\nLine 2")

let arr0: Array = [1, 2]
let dic0: Dictionary = ["first" : "1"]
var str: String?

// 6
myPrint("function 作为函数的默认参数")

func logFunctionName(string: String = #function) {
    print(string)
}

// 可以作为正常函数调用
logFunctionName(string: "aa")

// 在函数体内调用，打印 函数名字
func myFunction() {
    logFunctionName()
}
myFunction()

// 7
myPrint("闭包的非引用语义捕获列表")

var a = 0
var b = 0
let closure = {
    // a、b 有相同的行为
    print(a, b)
}

a = 10
b = 10
closure()

let closure2 = { [a] in
    // a、b 有不同的行为
    print(a, b)
}

a = 20
b = 20
closure2()

// 8
myPrint("闭包的引用语义捕获列表")

class SimpleClass {
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()

let closure3 = { [x] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10
closure3()

// 9
myPrint("隐式成员表达式")

enum MyEnumeration {
    case SomeValue
    case AnotherValue
}

var x_1 = MyEnumeration.SomeValue
x_1 = .AnotherValue

// 10
myPrint("key-path 表达式")

struct SomeStructure {
    var someValue: Int
}

let s = SomeStructure(someValue: 12)
let pathToProperty = \SomeStructure.someValue

let value = s[keyPath: pathToProperty]

// 11
myPrint("key-path 支持隐式表达式")

class SomeClass: NSObject {
    @objc var someProperty: Int
    init(someProperty: Int) {
        self.someProperty = someProperty
    }
}

let c = SomeClass(someProperty: 10)
c.observe(\.someProperty) { object, change in
    print("Value changed.")
}

// 12
myPrint("key-path 表达式点语法")

struct OuterStructure {
    var outer: SomeStructure
    init(someValue: Int) {
        self.outer = SomeStructure(someValue: someValue)
    }
}

let nested = OuterStructure(someValue: 24)
let nestedKeyPath = \OuterStructure.outer.someValue

let nestedValue = nested[keyPath: nestedKeyPath]

// 13
myPrint("key-path 表达式 路径中包含下标")

let greetings = ["hello", "hola", "bonjour", "google"]
let myGreeting = greetings[keyPath: \[String].[1]]

// 14
myPrint("key-path 使用下标进行值捕获")

var index = 2
let path = \[String].[index]
let fn: ([String]) -> String = {strings in strings[index]}

print(greetings[keyPath: path])
print(fn(greetings))

index += 1
print(greetings[keyPath: path])
print(fn(greetings))

// 15
myPrint("选择器表达式")

class SomeClass_1: NSObject {
    @objc let property: String
    @objc(doSomethingWithInt:)
    func doSomething(_ x: Int) { }
    
    init(property: String) {
        self.property = property
    }
}

let selectorForMethod = #selector(SomeClass_1.doSomething(_:))
let selectorForPropertyGetter = #selector(getter: SomeClass_1.property)

// 16
myPrint("key-path 字符串表达式")

class SomeClass_2: NSObject {
    @objc var someProperty: Int
    init(someProperty: Int) {
        self.someProperty = someProperty
    }
}

let c_2 = SomeClass_2(someProperty: 12)
let keyPath = #keyPath(SomeClass_2.someProperty)

if let value = c_2.value(forKey: keyPath) {
    print(value)
}

// 17
myPrint("在类的内部使用 key-path 字符串表达式")

extension SomeClass_2 {
    func getSomeKeyPath() -> String {
        return #keyPath(someProperty)
    }
}

print(keyPath == c_2.getSomeKeyPath())

// 18
myPrint("将构造器表达式作为一个值")

let initializer: (Int) -> String = String.init

let oneTwoThree = [1, 2, 3].map(initializer).reduce("", +)
print(oneTwoThree)

// 19
myPrint("构造器表达式省略 init")

// 可以省略
let s1 = SomeClass(someProperty: 19)

// 20
myPrint("类型别名为泛型类型的一部分提供具体类型")

typealias StringDictionary<Value> = Dictionary<String, Value>

var dic1: StringDictionary<Int> = [:]
var dic2: Dictionary<String, Int> = [:]

// 21
myPrint("带关联值的枚举可以当函数使用")

enum Number {
    case integer(Int)
    case real(Double)
}

// f 是 参数为 Int 返回值为 Number 的函数类型
let f = Number.integer

let evenInts: [Number] = [0, 2, 4, 6].map(f)

// 22
myPrint("使用扩展遵循协议时解决显式冗余")

protocol Serializable {
    func serialize() -> Any
}

// 会报错

/*
extension Array: Serializable where Element == Int {
    func serialize() -> Any {
        return "Int"
    }
}
extension Array: Serializable where Element == String {
    func serialize() -> Any {
        return "Int"
    }
}*/

// 解决方法

protocol SerializableInArray { }
extension Int: SerializableInArray {}
extension String: SerializableInArray {}

extension Array: Serializable where Element: SerializableInArray {
    func serialize() -> Any {
        return "Any"
    }
}

// 23
myPrint("dynamicCallable ")

@dynamicCallable
struct TelephoneExchange {
    // 需要实现的方法
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        if phoneNumber == [4, 1, 1] {
            print("从 Swift 论坛得到帮助。")
        } else {
            print("无法识别该编号。")
        }
    }
}

let dial = TelephoneExchange()

dial.dynamicallyCall(withArguments: [4, 1, 1])
// 和上面等价
dial(4, 1, 1)

dial(8, 6, 7, 5, 3)

@dynamicCallable
struct Repeater {
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs.map { label, count in
            repeatElement(label, count: count).joined(separator: " ")
        }.joined(separator: "\n")
    }
}

let repeatLabels = Repeater()
print(repeatLabels(a:1, b: 2, c: 3, b: 2, a: 1))

// 24
myPrint("dynamicMemberLookup")

@dynamicMemberLookup
struct DynamicStruct {
    let dictionry = ["someDynamicMember": 325,
                     "someOtherMember": 787]
    subscript(dynamicMember member: String) -> Int {
        return dictionry[member] ?? 1054
    }
}

let s24 = DynamicStruct()

let dynamic = s24.someDynamicMember

let equivalent = s24[dynamicMember: "someDynamicMember"]
print(dynamic == equivalent)

// 25
myPrint("可选模式")

let someInt: Int? = 41

if let x = someInt {
    print(x)
}

if case .some(let x) = someInt {
    print(x)
}

if case let x? = someInt {
    print(x)
}

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}

class PhotoVC: UIViewController {
    var library: PHPhotoLibrary = PHPhotoLibrary.shared()
}

let test = PhotoVC()


