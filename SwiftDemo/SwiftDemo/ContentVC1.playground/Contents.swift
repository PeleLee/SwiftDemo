import UIKit
import Darwin

var str = "Hello, playground"

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
let widthLabel2 = label + "\(width)."

let threeQuotes = """
我是"
哗啦哗啦"
乒乓球.
"""

let quotation = """
I said "I have apples."
And then I said "I have fruit."
"""

let shoppingList = ["First", "Two"]


// 字典
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)

// 初始化空数组
var emptyArray = [String]()
emptyArray.append(shoppingList[1])
// 初始化空字典
var emptyDic = [String:String]()

// if-let 内部包含了 =nil 的判断
var optionalName: String? = "John Appleseed."
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    greeting = "Oh no."
}

// ??
let nickName: String? = nil
let fullName: String = "John Appleseed."
let informalGreeting = "Hi \(nickName ?? fullName)"

// switch支持任意类型的数据比较  自带break
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case "red pepper1":
    print("Add a new case.")
case let x where x.hasPrefix("red"):
    print("Add a custom case.")
default:
    print("Everything tastes good in soup.")
}

// for-in
let interestingNumbers = [
    "First": [1, 2, 3, 4],
    "Two": [5, 9],
    "Three": [7, 8, 6]
]

var largest = 0
var times = 0

for (_, numbers) in interestingNumbers {
    for number in numbers {
        times += 1
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// 普通 while 语句
var n = 2
while n < 5 {
    n *= 2
}
print(n)

// repeat-while
repeat {
    n *= 2
} while n < 8
print(n)

// ..<
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// _ 不使用参数标签
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


// 使用元组使函数返回复合值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    
    if !(scores.count > 0) {
        return (0, 0, 0)
    }
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        
        if score > max {
            max = score
        }
        else if score < min {
            min = score
        }
        
        sum += score
        
    }
    
    return(min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.min)
print(statistics.1)
print(statistics.sum)

// 函数嵌套
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

//（函数是第一等类型）
// 函数作为函数的返回值
func makeIncrementer() -> ((Int) -> Int) {
    
    func addOne(number: Int) -> Int {
        return 1+number
    }
    
    return addOne(number:)
    
}

var increment = makeIncrementer()
increment(7)

// 函数作为函数的参数
func hasAnyMatches(list: [Int], condition: (Int)->Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
    
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 11, 12]
hasAnyMatches(list: numbers, condition: lessThanTen(number:))

numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen(number:))

/*
 函数 -> 是特殊的闭包
 使用 {} 来创建一个匿名闭包
 使用 in 将 <参数和返回值类型> 与 <函数体> 进行分离
 */
numbers.map({
    (number: Int) -> Int in
    let result = 3*number
    print(result)
    return result
})

// 忽略参数和返回值，单个语句闭包会把它语句的值当作结果返回
let mappedNumbers = numbers.map({number in 4*number})
print(mappedNumbers)

/*
 * 通过参数位置而不是参数名字来饮用参数。
 * 当一个闭包最为最后一个参数传递给函数的时候，它可以直接跟在圆括号后面。
 * 当一个闭包是传给函数的唯一参数，可以完全忽略圆括号
 */
let sortedNumbers = numbers.sorted {$0 > $1}
print(sortedNumbers)

// 类声明
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// 创建类实例
var shape = Shape()
// 点语法访问属性和方法
shape.numberOfSides = 7
print(shape.simpleDescription())

// 构造函数 -> 初始化类实例
// 每个属性都需要赋值 numberOfSides 和 name 的方式都可以
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        // 调用父类构造方法前，其他属性必须全部赋值过
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // 没有同名参数时，属性可以省略 self.
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
    
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: CGFloat
    
    init(radius: CGFloat, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> CGFloat {
        return CGFloat(Double.pi)*pow(self.radius, 2)
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of \(radius)"
    }
    
}

let testCircle = Circle(radius: 5, name: "My test square")
testCircle.area()
testCircle.simpleDescription()

/*
 * 存储属性 与 计算属性
 * 计算属性 的 getter 和 setter 计算属性
 */
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // 周长
    var perimeter: Double {
        get {
            return 3.0 * sideLength;
        }
        // 默认 newValue
        set(newPerimeter) {
            sideLength = newPerimeter/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength) and perimeter \(perimeter)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// willSet 和 didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.square.name)
print(triangleAndSquare.triangle.sideLength)
print(triangleAndSquare.triangle.name)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.square.name)
print(triangleAndSquare.triangle.sideLength)
print(triangleAndSquare.triangle.name)

// 可选值 ?
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let optionalSquare1: Square? = nil
let sideLength = optionalSquare?.sideLength
let sideLength1 = optionalSquare1?.sideLength

// 枚举包含方法
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .king:
            return "king"
        default:
            return "\(self.rawValue)"
        }
    }
}
let ace = Rank.ace
let king: Rank = .king
let six = Rank.six
let jack: Rank = .jack

let aceValue = ace.simpleDescription()
let kingValue = king.simpleDescription()
let sixValue = six.simpleDescription()
let jackValue = jack.simpleDescription()

// 从原始值创建一个枚举实例
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

let covertedRank2: Rank? = Rank(rawValue: 88)
let covertedRank2Des = covertedRank2?.simpleDescription()

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

// 枚举的关联值
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

var result = ServerResponse.result("6:00 am", "8:09 pm")

switch result {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure ... \(message)")
}

result = ServerResponse.failure("Out of cheese.")

switch result {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure ... \(message)")
}

// 结构体 struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
// 默认构造器
let threeOfSpades = Card(rank: .three, suit: .spades)
print(threeOfSpades.simpleDescription())

// protocol
protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}
// mutating方法会影响结构体中对属性的赋值
protocol ExampleProtocol2 {
    var simpleDescription: String {
        get
    }
    func adjust()
}

// class 遵守协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}
class SimpleClass2: ExampleProtocol2 {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

var a2 = SimpleClass2()
a2.adjust()
let aDescription2 = a2.simpleDescription

// struct 遵守协议
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple struture"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
struct SimpleStructure2: ExampleProtocol2 {
    func adjust() {
        // 没有 mutating 修饰，这里会报错
        //simpleDescription += " (adjusted)"
    }
    
    var simpleDescription: String = "A simple struture"
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// extension
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
var int_ex: Int = 7
int_ex.adjust()
print(int_ex.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

// 错误处理
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
// throws 与 throw
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// do-catch
// try可以抛出错误的代码
// 单个catch代码块
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// 多个catch代码块
do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

// try
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// defer
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("Banana")
print(fridgeIsOpen)
fridgeContains("milk")
print(fridgeIsOpen)

// 泛型 <>
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
makeArray(repeating: ["one":"一"], numberOfTimes: 5)

func makeArray1<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0...numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray1(repeating: "knock", numberOfTimes: 4)

// 使用泛型重新实现Swift的可选类型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// where 没太整明白
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3, 1], [2])
