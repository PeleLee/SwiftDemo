import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("in-out 参数的访问冲突")

var stepSize = 1
print(stepSize)

func increment(_ number: inout Int) {
    // 读
    number += stepSize
}

// 写操作与函数体内读操作重叠，出现冲突
//increment(&stepSize)

// 2
myPrint("解决 in-out 访问冲突")

var copyOfStepSize = stepSize
increment(&copyOfStepSize)

stepSize = copyOfStepSize
print(stepSize)

// 3
myPrint("in-out 参数的另一种冲突")

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    // 非整数情况
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
print(playerOneScore)
print(playerTwoScore)

// 正常
balance(&playerOneScore, &playerTwoScore)
print(playerOneScore)
print(playerTwoScore)
// 错误
//balance(&playerTwoScore, &playerTwoScore)

// 4
myPrint("结构体 mutating 方法里 self 的访问冲突")

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10

    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var 佐伊 = Player(name: "佐伊", health: 10, energy: 10)
var EZ = Player(name: "EZ", health: 5, energy: 10)

print(佐伊.health)
print(EZ.health)

佐伊.shareHealth(with: &EZ)

print(佐伊.health)
print(EZ.health)

// 冲突
//EZ.shareHealth(with: &EZ)

// 5
myPrint("属性的访问冲突")

// 元组类型
var playerInfomation = (healty: 10, energy: 20)
// 冲突
//balance(&playerInfomation.healty, &playerInfomation.energy)

// 6
myPrint("安全的重叠访问")

var holly = Player(name: "Holly", health: 10, energy: 10)
// 不安全的重叠访问
//balance(&holly.health, &holly.energy)

func someFunctin() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    // 安全的重叠访问
    balance(&oscar.health, &oscar.energy)
}

someFunctin()
