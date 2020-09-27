import UIKit

func myPrint(info: String) {
    print("🐤🐤🐤打印内容---", info)
}
// 5----------
myPrint(info: "嵌套枚举")
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// (5+4)x2
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left)+evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

// 4----------
myPrint(info: "枚举的隐式赋值")
enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {
    case north = "one", south, east, west
}

let marsOrder = Planet.mars.rawValue
print(marsOrder)

let sunsetDirection = CompassPoint.west.rawValue
print(sunsetDirection)

let possiblePlanet = Planet(rawValue: 10)
print(possiblePlanet ?? "possiblePlanet初始化失败")

// 3----------
myPrint(info: "枚举的原始值")
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let ascii1 = ASCIIControlCharacter.lineFeed
print(ascii1)

// 2----------
myPrint(info: "枚举关联值")
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var pruductBarcode = Barcode.upc(8, 85909, 51226, 3)
print(pruductBarcode)
pruductBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(pruductBarcode)

switch pruductBarcode {
case .upc(let numberSystem, let maunfacturer, let pruduct, let check):
    print("UPC: \(numberSystem), \(maunfacturer), \(pruduct), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

myPrint(info: "switch匹配枚举成员时的简便写法")
switch pruductBarcode {
case let .upc(numberSystem, maunfacturer, pruduct, check):
    print("UPC: \(numberSystem), \(maunfacturer), \(pruduct), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// 1----------
myPrint(info: "CaseIterable协议")
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
for beverage in Beverage.allCases {
    print(beverage)
}

