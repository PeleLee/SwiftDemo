import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

myPrint("结构体类型的成员逐一构造器")
struct Resolution {
    var width = 0
    var height = 0
}

let vga = Resolution(width: 640, height: 480)

myPrint("枚举也是值类型")
enum CompassPoint: Int {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

// ？这里有个疑问，currentDirection到底是什么类型，为什么可以以字符串的形式打印
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

