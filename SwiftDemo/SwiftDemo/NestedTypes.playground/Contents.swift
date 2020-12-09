import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

// 1
myPrint("嵌套类型实践")

// 扑克牌21点
struct BlackjackCard {
    
    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    // 嵌套的 Rank 枚举
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
    
}

let 黑桃A = BlackjackCard(rank: .ace, suit: .spades)
let 红桃5 = BlackjackCard(rank: .five, suit: .hearts)

print(黑桃A.description)
print(红桃5.description)
