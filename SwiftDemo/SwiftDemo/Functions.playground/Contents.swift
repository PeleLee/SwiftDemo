import UIKit

func myPrint(info: String) {
    print("🐤🐤🐤打印内容----------", info)
}

myPrint(info: "函数的元组返回值命名")
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("bounds min is \(String(describing: bounds?.min)) and max is \(String(describing: bounds?.max))")

let bounds2 = minMax(array: [])
print("bounds2 min is \(String(describing: bounds2?.min)) and max is \(String(describing: bounds2?.max))")

myPrint(info: "隐式返回的函数")
func greeting(for person: String) -> String {
    "Hello," + person + "!"
}
print(greeting(for: "Dave"))

myPrint(info: "忽略参数标签")
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    print("奉俊昊")
}
someFunction(1, secondParameterName: 2)

myPrint(info: "默认参数值")
func someFunction(parameterWithoutDefault firstValue: Int, parameterWithDefault secondValue: Int = 12) {
    print("杀人回忆 \(firstValue) and \(secondValue).")
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 4)
someFunction(parameterWithoutDefault: 5)

func someFunction(parameterWithDefalt firstValue: Int = 12, parameterWithoutDefalut2 secondValue: Int) {
    print("汉江怪物 \(firstValue) \(secondValue).")
}
someFunction(parameterWithDefalt: 6, parameterWithoutDefalut2: 7)
someFunction(parameterWithoutDefalut2: 8)

myPrint(info: "可变参数")
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

myPrint(info: "输入输出参数 inout")
func swapTowInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
print("交换前 someInt:\(someInt) anotherInt:\(anotherInt)")
swapTowInts(&someInt, &anotherInt)
print("交换后 someInt:\(someInt) anotherInt:\(anotherInt)")

myPrint(info: "使用函数类型作为变量")
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(9, 10))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(9, 10))")

myPrint(info: "使用函数类型作为函数参数")
func printMathResult(_ mathFunction:(Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Results: \(mathFunction(a, b)).")
}
printMathResult(addTwoInts, 7, 8)
printMathResult(multiplyTwoInts, 7, 8)

myPrint(info: "使用函数类型作为函数返回值")
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerTozero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerTozero(currentValue)
}
print("zero!")

myPrint(info: "嵌套函数")
func chooseStepFunction2(backward: Bool) -> ((Int)->Int) {
    func stepForward2(input: Int) -> Int {input+1}
    func stepBackward2(input: Int) -> Int {input-1}
    return backward ? stepBackward2 : stepForward2
}
var currentValue2 = -5
let moveNearerTozero2 = chooseStepFunction2(backward: currentValue2 > 0)
while currentValue2 != 0 {
    print("\(currentValue2)")
    currentValue2 = moveNearerTozero2(currentValue2)
}
print("zero!")
