import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

// 13
myPrint("通过闭包设置属性的默认值")

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))

// 11
myPrint("重写一个可失败构造器")

class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "Untitled"
    }
    override init?(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "Untitled"
        } else {
            self.name = name
        }
    }
}

// 涉及强制解包
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// 10
myPrint("带原始值的枚举类型的可失败构造器")

enum TemperatureUnitV2: Character {
    case Kelven = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUnitV2(rawValue: "F")
if fahrenheitUnit != nil {
    print("Initialization succeeded.")
}

let unknownUnit = TemperatureUnitV2(rawValue: "X")
if unknownUnit == nil {
    print("Initialization failed.")
}

// 9
myPrint("枚举类型的可失败构造器")

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fathrenheit = TemperatureUnit(symbol: "F")
if fathrenheit != nil {
    print("This is a defined temperature unit.")
}

let unknowUnit = TemperatureUnit(symbol: "X")
if unknowUnit == nil {
    print("This is not a defined temperature unit.")
}

// 8
myPrint("自定义的可失败构造器")

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

print("--Animal")
if let anonymousCreature = Animal(species: "") {
    print("have" + anonymousCreature.species)
} else {
    print("The anonymous creature could not be initialized")
}

// 7
myPrint("系统自带的可失败构造器")

let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}

// 6
myPrint("指定构造器与便利构造器实践")

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let mysteryMeat = Food()
print("--mysteryMeat")
print(mysteryMeat.name)

/// 配方配料
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    // 将父类指定构造器重写为便利构造器，所以自动继承父类的所有便利构造器
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

// 自动继承来的便利构造器
let oneMysteryItem = RecipeIngredient()
print("--oneMysteryItem")
print(oneMysteryItem.name)
print(oneMysteryItem.quantity)

// 便利构造器
let oneBacon = RecipeIngredient(name: "Bacon")

// 指定构造器
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

/// 继承了父类的所有指定构造器和便利构造器
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " 已购买" : " 未购买"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

print("--breakfastList")
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// 5
myPrint("值类型的构造器代理")

struct mySize {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = mySize()
    
    // 构造器1
    init() {}
    
    // 构造器2
    init(origin: Point, size: mySize) {
        self.origin = origin
        self.size = size
    }
    
    // 构造器3 调用（代理）构造器2
    init(center: Point, size: mySize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}

// 4
myPrint("结构体的逐一成员构造器")

struct Size {
    var width = 0.0, height = 0.0
}

// 都不省略
let twoTyTwo = Size(width: 2.0, height: 2.0)
// 省略 width
let zeroByTwo = Size(height: 2.0)
// 省略 width 和 height
let zeroByZero = Size()

// 3
myPrint("初始化时是否可以修改常量属性")

class SurveyQuestion {
    let text = "aaa"
    init(text: String) {
        // 不能修改，会报错。教程中的翻译不准。introduces 是‘赋值’，而不是‘修改’
        //self.text = "bbb"
    }
}

// 2
myPrint("不带标签的初始化参数")

struct Celsius {
    var temperatureInCelsius: Double
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius(37.0)

// 1
myPrint("初始化参数标签和参数名称")

struct Color {
    let red, green, blue: Double
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let halfGray = Color(white: 0.5)

