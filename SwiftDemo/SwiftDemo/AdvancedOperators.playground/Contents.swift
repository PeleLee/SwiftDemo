import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("Bitwise NOT Operator")

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

// 2
myPrint("Bitwise AND Operator")

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits


// 3
myPrint("Bitwise OR Operator")

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

// 4
myPrint("Bitwise XOR Operator")

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

// 5
myPrint("使用移位运算符分解颜色")

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = (pink & 0x0000FF)

// 6
myPrint("数值溢出")

var potentialOverflow = Int8.max
potentialOverflow &+= 1

var unsignedOverflow = UInt8.min
unsignedOverflow &-= 1

// 7
myPrint("二元中缀运算符重载")

var plusTmp = 2
// 从这里看系统 + 定义
plusTmp = plusTmp + plusTmp

// 向量
struct Vector2D {
    var x = 0.0, y = 0.0
}
// 向量相加
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// 8
myPrint("前缀和后缀运算符重载")

var tmp = -1
// 从这里看系统 前缀 - 定义
tmp = -tmp

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negetive = -positive

// 9
myPrint("重载复合赋值运算符")

var tmp001 = 1
// 从这里看系统 += 定义
tmp001 += 1

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

// 10
myPrint("自定义 等价运算符")

let tmp002 = 11
let tmp003 = 22
if tmp002 == tmp003 {
    print("")
}

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("两个相等的坐标.")
}

// 11
myPrint("等价运算符有默认实现的自定义类型")

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

// 这里的 == 是系统实现的
if twoThreeFour == anotherTwoThreeFour {
    print("两个相等的三维坐标")
}

// 12
myPrint("自定义运算符")

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
print(toBeDoubled.x)
let afterDoubling = +++toBeDoubled
print(toBeDoubled.x)

// 13
myPrint("自定义中缀运算符的优先级")

infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector

// 14
myPrint("使用 type(of:) 获取元类型")

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}

class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}

let someInstance: SomeBaseClass = SomeSubClass()
type(of: someInstance).printClassName()

// 15
myPrint("自身类型 Self")

class Superclass {
    func f() -> Self {return self}
}

let x = Superclass()
print(type(of: x.f()))

class Subclass: Superclass { }

let y = Subclass()
print(type(of: y.f()))

let z: Superclass = Subclass()
print(type(of: z.f()))

// 16
myPrint("类型转化表达式")

func f(any: Any) { print("Function for Any") }
func f(int: Int) { print("Function for Int") }

let xInt = 10
f(int: xInt)

let yAny: Any = xInt
f(any: yAny)

f(any: x as Any)


