import UIKit

func printTagPrefix(tag: String) {
    print("🐤🐤🐤---", tag)
}

// 数组初始化：重复元素
printTagPrefix(tag: "创建包含重复元素的数组")
var threeDoubles = Array(repeating: "三岁", count: 3)
print(threeDoubles)

// 检查count属性
printTagPrefix(tag: "isEmpty检查数组为空")
let shoppingList: [String] = []
if shoppingList.isEmpty {
    print("The shopping list is empty.")
}

// 批量修改数组元素
printTagPrefix(tag: "批量修改数组元素")
var shopoingList2 = ["egg", "milk", "meat", "computer"]
print(shopoingList2)
shopoingList2[1...3] = ["pen"]
print(shopoingList2)

printTagPrefix(tag: "删除最后一个和第一个的便捷方法")

shopoingList2.removeFirst()
print(shopoingList2)
shopoingList2.removeLast()
print(shopoingList2)

printTagPrefix(tag: "enumerated()方法遍历数组")

shopoingList2 = ["egg", "milk", "meat", "computer"]
for (index, value) in shopoingList2.enumerated() {
    print("Item \(index+1): \(value)")
}

if shopoingList2.contains("egg") {
    print("买了鸡蛋")
}

printTagPrefix(tag: "集合初始化")
// 相同的元素只会保留一个
var favorateGenres: Set<String> = ["Rock", "Classical", "Hip hop", "Rock"]
print(favorateGenres)
// 类型推断 可以省略类型声明
var favorateGenres2: Set = ["Rock", "Classical", "Hip hop", "Rock"]
print(favorateGenres2)

// sorted()方法
printTagPrefix(tag: "集合的sorted()方法")
for genre in favorateGenres2.sorted(by: { (a, b) -> Bool in
    a > b
}) {
    print(genre)
}
printTagPrefix(tag: "集合的sorted()方法变更数组顺序")
for genre in favorateGenres2.sorted(by: { (a, b) -> Bool in
    a < b
}) {
    print(genre)
}

printTagPrefix(tag: "两个集合的操作")

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]

let sigleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(sigleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(sigleDigitPrimeNumbers).sorted())

printTagPrefix(tag: "字典的初始化")

// 包含重复的 Key 会报错
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"/*, "DUB": "假的"*/]
print(airports)

printTagPrefix(tag: "字典的updateValue(_:forKey:)方法")
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

let airportCodes = airports.keys
print(airportCodes.sorted())
print(airportCodes.sorted(by: { (a, b) -> Bool in
   a > b
}))

let test001: [String] = airportCodes


