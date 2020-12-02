import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

// 1
myPrint(" throwing 函数")

struct Item {
    var price: Int
    var count: Int
}

enum VendingMachineError: Error {
    /// 选择无效
    case invalidSelection
    /// 金额不足
    case insufficientFunds(coinsNeeded: Int)
    /// 缺货
    case outOfStock
}

/// 自动贩卖机
class VendingMachine {
    /// 库存
    var inventory = [
        // 糖果棒
        "Candy Bar": Item(price: 12, count: 7),
        // 薯条
        "Chips": Item(price: 10, count: 4),
        // 椒盐脆饼
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    /// 存放的硬币
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("\(name)正在出货...")
    }
}

let favoriteSnacks = [
    "小驴儿": "Chips",
    "大驴儿": "Licorice",
    "驴儿": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "大驴儿", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

// 既可以在内部处理错误
func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

// 也可以在调用方处处理错误
do {
    try nourish(with: "Beet-Flavored Chips.")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
