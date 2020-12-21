import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("属性要求")

protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    // 也可以是可读可写的
    /*var fullName: String {
        get {
            return (prefix != nil ? prefix! + " " : "") + name
        }
        set {
            // do something
        }
    }*/
}

var ncc1701 = Starship(name: "嫦娥", prefix: "中国")
print(ncc1701.fullName)

// 2
myPrint("mutating 方法")

// 切开关
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// 3
myPrint("将协议作为类型使用")

protocol RandomNunberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNunberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNunberGenerator
    init(sides: Int, generator: RandomNunberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// 4
myPrint("使用协议实现委托")

protocol TextRepresentable {
    var textualDescription: String { get }
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

extension SnakeAndLadders: TextRepresentable {
    var textualDescription: String {
        return "蛇和梯子--\(finalSquare)步版本"
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadders {
            print("蛇和梯子游戏开始了！")
        }
        print("该轮游戏使用的是\(game.dice.sides)面骰子。")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("扔了\(diceRoll)点。")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("这轮游戏持续了\(numberOfTurns)个回合。")
    }
}

let trancker = DiceGameTracker()
let game = SnakeAndLadders()
game.delegate = trancker
game.play()

// 5
myPrint("有条件地遵守协议")

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "这是一个\(sides)面的骰子"
    }
}

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ",") + "]"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
let myDice = [d6, d12]
print(myDice.textualDescription)

// 6
myPrint("Array 的 joined() 方法")

var array0 = ["first", "two", "three"]
print(array0.joined())
print(array0.joined(separator: "+"))

// 7
myPrint("在扩展中声明采纳协议")

struct Hamster {
    var name: String
    var textualDescription: String {
        return "这只小仓鼠的名字是\(name)。"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

// 8
myPrint("协议类型的集合")

let things: [TextRepresentable] = [d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}

// 9
myPrint("协议的继承")

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakeAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

// 10
myPrint("类专属的协议")

protocol classProtocol: AnyObject {
    func description()
}

class myClass: classProtocol {
    func description() {
        print("只有类才可以遵守的协议。")
    }
}

let myClassObject: myClass = myClass()
myClassObject.description()

/*struct myStruct: classProtocol {
    var description: String {
        return "结构体不能遵守 classProtocol 协议"
    }
}*/

// 11
myPrint("组合两个协议作为函数参数")

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("祝\(celebrator.name)小朋友\(celebrator.age)岁生日快乐！")
}

let birtydayPerson = Person(name: "孔老夫子", age: 2570)
wishHappyBirthday(to: birtydayPerson)

// 12
myPrint("组合 (协议 + 父类) 作为函数参数")

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

let seattle = City(name: "西雅图", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

// 12
myPrint("组合 (协议 + 父类) 作为函数返回值")

func myFunc() -> Location & Named {
    return City(name: "上海", latitude: 121, longitude: 30)
}

let city = myFunc()
print("\(city.name)的经纬度是(\(city.latitude),\(city.longitude))")

// 13
myPrint("组合 (协议 + 父类) 作为变量类型")

class myClass01 {
    var city: Location & Named
    init(city: City) {
        self.city = city
    }
}

let myClass01Object = myClass01(city: seattle)
print("\(myClass01Object.city.name)的经纬度是(\(myClass01Object.city.latitude),\(myClass01Object.city.longitude))")

// 14
myPrint("可选的协议要求只能用在与和 OC 混编")

/*protocol myProtocol {
    optional func sayHello()
}*/
print("会报错")

// 15
myPrint("可选的协议要求--- 1")

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

// 16
myPrint("可选的协议要求--- 2")

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

// 17
myPrint("协议扩展")

extension RandomNunberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator2.random()).")
print("And here's a random Boolean: \(generator2.randomBool())")

// 18
myPrint("使用协议扩展 提供默认实现")

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

// 19
myPrint("为协议扩展添加 限制条件")

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100]
let differentNumbers = [100, 200, 300]

print(equalNumbers.allEqual())
print(differentNumbers.allEqual())
