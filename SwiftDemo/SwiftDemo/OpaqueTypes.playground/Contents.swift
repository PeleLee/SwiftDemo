import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("使用 * 画指定行数的直角三角形")

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

// 2
myPrint("反转三角形")

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        // 分隔字符串
        let lines = shape.draw().split(separator: "\n")
        // 逆转顺序后输出
        return lines.reversed().joined(separator: "\n")
    }
 }

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

// 3
myPrint("拼接图形")

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())

// 4
myPrint("返回不透明类型 画梯形")

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 3)
    let middle = Square(size: 3)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

// 5
myPrint("返回协议类型 画梯形")

func makeTrapezoid2() -> Shape {
    let top = Triangle(size: 3)
    let middle = Square(size: 3)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid2 = makeTrapezoid2()
print(trapezoid2.draw())

// 6
myPrint("不透明类型 和 泛型 结合")

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

// 7
myPrint("不透明类型返回值 多个return")

/*func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
    if shape is Square {
        return shape
        //return shape as! Square
    }
    return FlippedShape(shape: shape)
    //return Square(size: 2)
}*/

