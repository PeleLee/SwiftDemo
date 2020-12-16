import UIKit

func printTag(tag: String) {
    print("------------------------🐤🐤🐤:" + tag)
}

// 1
printTag(tag: "for-in 遍历字典")

let numberOfLegs = ["🕷️": 8, "🐜": 6, "🐱": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) 有 \(legCount) 条腿.")
}

// 2
printTag(tag: "for-in 隐式声明变量")

for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}

// 3
printTag(tag: "for-in 省略变量")

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) 的 \(power)次幂是 \(answer)")

// 4
printTag(tag: "for-in 的 stride 方法实现跳过开区间")

let minutes = 60
let minuteInterval = 5
for trickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("当前时间是 \(trickMark) 分钟.")
}

printTag(tag: "for-in 的 stride 方法实现跳过闭区间")
for trickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print("当前时间是 \(trickMark) 分钟.")
}

// 5
printTag(tag: "🐍和梯子的游戏")
let finalSquare = 25
var board: [Int] = Array(repeating: 0, count: finalSquare+1)

board[03] += 08
board[06] += 11
board[09] += 09
board[10] += 02
board[14] -= 10
board[19] -= 11
board[22] -= 02
board[24] -= 08

var square = 0
var diceRoll = 0

while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    print("square before:\(square)")
    if square < board.count {
        square += board[square]
        print("square after:\(square)")
    }
}
print("Game over!")

// 6
printTag(tag: "if语句 省略else 的情况")
var temperatureInfahrenheit = 72
temperatureInfahrenheit = 88
if temperatureInfahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
else if temperatureInfahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

// 7
printTag(tag: "Switch case 错误写法")
/*
let anotherCharacter0: Character = "a"
switch anotherCharacter0 {
case "a":
//    fallthrough
case "A":
    print("The letter A")
default:
    print("Not eht letter A")
}*/


let anotherCharacter: Character = "A"
switch anotherCharacter {
// 复合型 Cases
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 8
printTag(tag: "switch case分支--匹配区间")

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// 9
printTag(tag: "switch case分支--元组匹配")

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) 在原点上。")
case (_, 0):
    print("\(somePoint) 在 x 轴上。")
case (0, _):
    print("\(somePoint) 在 y 轴上。")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box.")
default:
    print("\(somePoint) is outside of the box.")
}

// 10
printTag(tag: "switch case分支--值绑定")

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("\(anotherPoint)在 x 轴上，x 坐标为 \(x)。")
case (0, let y):
    print("\(anotherPoint)在 y 轴上，y 坐标为 \(y)。")
default:
    print("\(anotherPoint) 不在坐标轴上。")
}

// 11
printTag(tag: "switch case分支--Where 判断更复杂的条件")

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x),\(y)) 在 x = y 对角线上。")
case let (x, y) where x == -y:
    print("(\(x), \(y)) 在 x = -y 对角线上。")
case let (x, y):
    print("(\(x), \(y)) 不在对角线上。")
}

// 12
printTag(tag: "switch case分支--复合型Cases")

let someCharacter: Character = "e"
switch someCharacter {
case "a", "b", "c", "d", "e", "f", "g", "h",
     "i", "j", "k", "l", "m", "n":
    print("test multi line.")
default:
    print("another case.")
}

// 13
printTag(tag: "switch case分支--复合型Cases 值绑定")

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// 14
printTag(tag: "带标签的语句")

let finalSquare2 = 25
var board2 = [Int](repeating: 0, count: finalSquare2+1)
board2[03] += 08
board2[06] += 11
board2[09] += 09
board2[10] += 02
board2[14] -= 10
board2[19] -= 11
board2[22] -= 02
board2[24] -= 08
var square2  = 0
var diceRoll2 = 0

gameLoop: while square2 != finalSquare2 {
    diceRoll2 += 1
    if diceRoll2 == 7 {
        diceRoll2 = 1
    }
    switch square2+diceRoll2 {
    case finalSquare2:
        break gameLoop
    case let newSquare where newSquare > finalSquare2:
        continue gameLoop
    default:
        square2 += diceRoll2
        square2 += board2[square2]
    }
}
print("Game over!")

// 15
printTag(tag: "guard语句")

func greet(person: [String: String]) {
    // 声明 name 常量并用 guard 保护
    guard let name = person["name"] else {
        return
    }
    /*var name2 = ""
    if let name = person["name"] {
        name2 = name
    } else {
        return
    }*/
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
    
    // guard let 与 if let 声明常量的作用域不同
    if let tmp = person["one"] {
        print("my test \(tmp)")
    }
//    print("Hello \(tmp)")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])

// 15
printTag(tag: "检测 API 可用性")

if #available(iOS 10, macOS 10.12, watchOS 5, tvOS 12, /*iPadOS 12,*/ *) {
    print("1")
}
