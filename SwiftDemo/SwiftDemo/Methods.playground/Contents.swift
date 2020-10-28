import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

myPrint("在可变方法中给self赋值")

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var point1 = Point(x: 10, y: 10)
print(point1)
point1.moveBy(x: 20, y: 20)
print(point1)

myPrint("枚举的可变方法可以把self设置为同一枚举类型中不同的成员")

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
print(ovenLight)
ovenLight.next()
print(ovenLight)
ovenLight.next()
print(ovenLight)

myPrint("类型方法")

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    // 忽略返回值
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    init(name: String) {
        playerName = name
    }
    func complete(level: Int) {
        LevelTracker.unlock(level+1)
        tracker.advance(to: level+1)
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
player.complete(level: 3)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6.")
} else {
    print("level 6 has not yet been unlocked.")
}
