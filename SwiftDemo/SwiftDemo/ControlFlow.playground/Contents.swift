import UIKit

func printTag(tag: String) {
    print("----🐤🐤🐤----打印内容:", tag)
}

printTag(tag: "for-in 的 stride方法实现跳过")
let minutes = 60
let minuteInterval = 5
for trickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("当前时间是 \(trickMark) 分钟.")
}

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

printTag(tag: "if语句 省略else 的情况")
var temperatureInfahrenheit = 72
temperatureInfahrenheit = 88
if temperatureInfahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
else if temperatureInfahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

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

printTag(tag: "switch case分支--元组匹配")
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

printTag(tag: "switch case分支--值绑定")
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
default:
    print("somewhere else at \(anotherPoint)")
}

printTag(tag: "switch case分支--Where 判断额外的条件")
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x),\(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

printTag(tag: "switch case分支--复合型Cases")
let someCharacter: Character = "e"
switch someCharacter {
case "a", "b", "c", "d", "e", "f", "g", "h",
     "i", "j", "k", "l", "m", "n":
    print("test multi line.")
default:
    print("another case.")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

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

printTag(tag: "guard语句")
func greet(person: [String: String]) {
    guard let name = person["name"] else { return }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
    /*if let tmp = person["one"] {
        print("my test \(tmp)")
    }
    // guard let 与 if let 声明常量的作用域不同
    print("my test \(tmp)")
    */
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])
