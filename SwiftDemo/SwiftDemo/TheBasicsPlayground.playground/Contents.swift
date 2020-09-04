import UIKit

/*
 print高级用法
 掘金:https://juejin.im/entry/6844903428984963080
 StackOverFlow:https://stackoverflow.com/questions/30865233/print-without-newline-in-swift/30865283#30865283
 */

let str1 = "123"
let str2 = "456"

print("\(str1)\(str2)")

print(str1, str2, separator:" ")

print(str1, str2, separator: "-a-", terminator: ".\n")

// 连接多个打印
print(str1, terminator:" ")
print(str2)


// 元组的内容分解
let http404Error = (404, "Not Found")
// 全部分解
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode).")
print("The status message is \(statusMessage).")
// 部分分解
let (_, justsTheStatusMessage) = http404Error
print("The status message is \(justsTheStatusMessage).")

// 通过下标访问元组元素
print("The status code is \(http404Error.0).")
print("The status message is \(http404Error.1).")

// 元组元素命名
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode).")
print("The status message is \(http200Status.description).")

// 可选绑定
let possibleNumber = "1234"
if var actualNumber = Int(possibleNumber) {
    actualNumber += 1
    print(actualNumber)
}

// 可选绑定包含多个判断
if let firstNumber = Int("4"), let secondNumber = Int("42") {
    print(firstNumber, secondNumber)
}

// 断言
var age = -3
//age = 3
assert(age >= 0, "A person's age cannot be less than zero.")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
}
else if age > 0 {
    print("You can ride the ferris wheel.")
}
else {
    assertionFailure("A person's age can't be less than zero.")
}

// 先决条件
var index = -1
precondition(index > 0, "Index must be greater than zero.")
