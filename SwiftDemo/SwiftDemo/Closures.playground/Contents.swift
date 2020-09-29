import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤打印内容：", info)
}

myPrint("使用sorted和顺序函数排序")
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

myPrint("使用sorted和闭包表达式排序")
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})
print(reversedNames)

myPrint("将闭包表达式简化为一行")
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2})
print(reversedNames)

myPrint("省略参数类型和括号")
reversedNames = names.sorted(by: { s1, s2 in return s1 < s2})
print(reversedNames)

myPrint("单行函数体隐式返回")
reversedNames = names.sorted(by: { (s1, s2) in s1 > s2})
print(reversedNames)

myPrint("参数名称缩写")
reversedNames = names.sorted(by: {$0 < $1})
print(reversedNames)

myPrint("运算符方法")
reversedNames = names.sorted(by: >)
print(reversedNames)

let values = [5, 2, 8, 3, 7, 0, 9]
var reversedValues = values.sorted(by: <)
print(reversedValues)

myPrint("尾随闭包")
reversedValues = values.sorted() {$0 > $1}
print(reversedValues)

myPrint("尾随闭包去除函数调用后面的括号")
reversedValues = values.sorted {$0 < $1}
print(reversedValues)

myPrint("数组map方法搭配尾随闭包使用")
let digitNames = [0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
                  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = (digitNames[number % 10] ?? "") + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

myPrint("嵌套函数的值捕获")
func makeIncrementer(forIncrement amount: Int) -> (()->Int) {
    var runningTotal = 10
    print("--1 \(runningTotal)")
    print("--1 \(amount)")
    func incrementer() -> Int {
        print("--2 \(runningTotal)")
        print("--2 \(amount)")
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementer1 = makeIncrementer(forIncrement: 1)
print(incrementer1) // 闭包是引用类型
print(incrementer1())
print(incrementer1())
print(incrementer1())
let incrementer7 = makeIncrementer(forIncrement: 7)
print(incrementer7) // 闭包是引用类型
print(incrementer7())
print(incrementer7())
print(incrementer7())

print(incrementer1())
print(incrementer7())

myPrint("闭包是引用类型")
let alsoIncrement7 = incrementer7
print(alsoIncrement7())

myPrint("逃逸闭包")
var completionHandlers: [() -> Void] = []
// 逃逸闭包
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

myPrint("逃逸闭包与非逃逸闭包的使用差别")
// 非逃逸闭包
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
// 包含非逃逸闭包的函数定义调用后立即执行闭包内容
instance.doSomething()
print(instance.x)
// 包含逃逸闭包的函数定义调用后将闭包添加到数组，手动调用
completionHandlers.first?()
print(instance.x)

myPrint("自动闭包实现延时执行")
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)

print(customerProvider)
print("Now serving \(customerProvider())!")
print(customersInLine.count)

myPrint("显式声明自动闭包作为函数参数")
func serve(customer customerProvider: ()->String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: {customersInLine.remove(at: 0)})
print(customersInLine.count)

myPrint("使用@autoclosure关键字")
func serve2(customer customerProvider: @autoclosure ()->String) {
    print("Now serving \(customerProvider())!")
}
serve2(customer: customersInLine.remove(at: 0))

myPrint("同时使用逃逸闭包和自动闭包")
var customerProviders: [()->String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping ()->String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
