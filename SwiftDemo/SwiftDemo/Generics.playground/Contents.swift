import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("泛型函数")

func swapTwoValues<TM>(_ a: inout TM, _ b: inout TM) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
print("someInt: \(someInt)---anotherInt: \(anotherInt)")
swapTwoValues(&someInt, &anotherInt)
print("someInt: \(someInt)---anotherInt: \(anotherInt)")

var someString = "hello"
var anotherString = "Swift"
print("someString: \(someString)---anotherString: \(anotherString)")
swapTwoValues(&someString, &anotherString)
print("someString: \(someString)---anotherString: \(anotherString)")

// 2
myPrint("定义泛型类型--手动实现栈")

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("亚洲")
stackOfStrings.push("中国")
stackOfStrings.push("上海")
stackOfStrings.push("五角场")
print(stackOfStrings)

stackOfStrings.pop()
print(stackOfStrings)

// 3
myPrint("泛型扩展")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

// 4
// 查看 Dictionary 定义
let myDic: Dictionary = ["1": "First"]

// 5
myPrint("类型约束实践")

// 非泛式函数
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["🐱", "🐶", "🐂"]
if let foundIndex = findIndex(ofString: "🐂", in: strings) {
    print("🐂的索引是\(foundIndex)")
}

// 非泛式 扩展为 泛式，不添加类型约束
/*func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        // 自定义类型不能用 == 进行比较
        if value == valueToFind {
            return index
        }
    }
    return nil
}*/

// 非泛式 扩展为 泛式，添加类型约束
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

if let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25]) {
    print("9.3 index is \(doubleIndex).")
}
if let stringIndex = findIndex(of: "aa", in: ["aa", "bb", "cc"]) {
    print("aa index is \(stringIndex).")
}

// 6
myPrint("关联类型")

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack {
    // 原定义
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 遵守 Container 协议
extension IntStack: Container {
    // 这一行可以省略，Swift 的类型判断可以得出 Item 为 Int
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var intStack1 = IntStack()
intStack1.append(1)
intStack1.append(2)

print(intStack1.count)
print(intStack1[0])

let array1 = ["one", "two"]

// 7
myPrint("扩展现有类型来指定关联类型")

extension Array: Container {}

// 8
myPrint("给关联类型添加约束")

protocol Container_1 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// 9
myPrint("在关联类型约束里使用协议")

protocol SuffixableContainer: Container_1 {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack: Container {
    typealias Item = Element
    var count: Int {
        return items.count
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
/*
extension Stack: SuffixableContainer {
    
    typealias Suffix = Stack
    
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count - size)..<count {
            result.append(self[index])
        }
        return result
    }
}*/

// 10
myPrint("泛型 Where 语句")

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.Item == C2.Item, C1.Item: Equatable{
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var arrayOfStrings = ["一", "二", "三"]

var stackOfStrings_1 = Stack<String>()
stackOfStrings.push("一")
stackOfStrings.push("二")
stackOfStrings.push("三")

if allItemsMatch(arrayOfStrings, stackOfStrings_1) {
    print("All items match.")
} else {
    print("Not all items match.")
}

// 11
myPrint("where 子句作为扩展的一部分")

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        // 只有符合 Equatable 协议才可以使用 == 运算符
        return topItem == item
    }
}

// 12
myPrint("使用 where 子句扩展一个协议")

extension Container where Item: Equatable {
    func startWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

// 13
myPrint("使用 where 子句要求 类型参数为 指定类型")

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}

print([1260.0, 1200.0, 98.6].average())

// 14
myPrint("具有 where 子句的关联类型")

protocol Container_2 {
    associatedtype Item
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeInterator() -> Iterator
}
