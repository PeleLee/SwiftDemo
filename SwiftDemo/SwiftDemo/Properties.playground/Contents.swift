import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

myPrint("常量结构体实例的存储属性不可修改")

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//会报错
//rangeOfFourItems.firstValue = 6

myPrint("lazy 延迟加载存储属性")

class DataImporter {
    var fileName = "data.text"
    init() {
        print("importer被创建")
    }
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

print("创建manager")
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print("使用manager的importer属性")
print(manager.importer.fileName)

myPrint("只读计算属性")
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 只读不能set，会报错
//fourByFiveByTwo.volume = 100.0

myPrint("属性包装器")
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 12)
        }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

myPrint("设置被包装属性的初始值")

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, maximum)
        }
    }
    
    init() {
        print("🦞构造器1")
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        print("🦞构造器2")
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        print("🦞构造器3")
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

print("第一种用法：无参init")
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

print("第二种用法：设置wrappedValue初始值")
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 13
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

print("第三种用法：使用实参构造器来设置包装器")
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 5, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

print("第四种用法：wrappedValue参数与其他实参分开，但本质还调用同一个构造器")
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 10
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
print(mixedRectangle.width)

myPrint("从属性包装器中呈现一个值")
@propertyWrapper
struct SmallNmuber2 {
    var projectedValue1 = 0
    var projectedValue = false
    var wrappedValue: Int {
        get {
            return projectedValue1
        }
        set {
            if newValue > 12 {
                projectedValue1 = 12
                projectedValue = true
            } else {
                projectedValue1 = newValue
                projectedValue = false
            }
        }
    }
}

struct SomeStructure {
    @SmallNmuber2 var someNumber: Int
}

var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

myPrint("属性包装器中被呈现值的另一种用法:类型内部访问，可以省略self.")

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNmuber2 var height: Int
    @SmallNmuber2 var width: Int
    
    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

var sizedRectangleItem = SizedRectangle()
print(sizedRectangleItem.resize(to: .small))

myPrint("类型属性")
struct SomeStructure2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure2.storedTypeProperty)
SomeStructure2.storedTypeProperty = "Another value."
print(SomeStructure2.storedTypeProperty)
print(SomeStructure2.computedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
