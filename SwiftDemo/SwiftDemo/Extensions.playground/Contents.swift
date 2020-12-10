import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

// 6
myPrint("使用扩展给 Int 添加嵌套类型")

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

// 5
myPrint("使用扩展给 Int 添加下标")

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

let digitInt = 746381295
print(digitInt[0])
print(digitInt[1])
print(digitInt[2])
print(digitInt[8])
print(digitInt[10])

// 4
myPrint("使用扩展增加可变的实例方法")

extension Int {
    mutating func square() {
        self = self * self
    }
}

var squareInt = 5
squareInt.square()
print(squareInt)

// 3
myPrint("使用扩展给 Int 添加方法")

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

// 2
myPrint("使用扩展添加构造器")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwishRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 1
myPrint("使用扩展为内建的 Double 类型添加计算属性")

// 模拟距离单位，实现距离转换
extension Double {
    var km: Double {
        return self * 1000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100.0
    }
    var mm: Double {
        return self / 1_000.0
    }
    /// 英尺
    var ft: Double {
        return self / 3.28084
    }
    var 里: Double {
        return self * 500.0
    }
    var 公里: Double {
        return self * 1000.0
    }
    
}

let 一里 = 1.0.里
print("一里是\(一里)米。")
let 一公里 = 1.0.公里
print("一公里是\(一公里)米。")
let 马拉松距离 = 42.0.km + 195.0.m
print("马拉松全程\(马拉松距离)米。")
