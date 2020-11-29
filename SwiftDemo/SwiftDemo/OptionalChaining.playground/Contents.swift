import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

//1
myPrint("访问可选类型的下标")

var testScores = ["LLL": [1, 2]]
testScores["QQQ"]?[2] = 6

//1
myPrint("为可选链式调用定义模型类")

class 房间 {
    let 房间名: String
    init(房间名: String) {
        self.房间名 = 房间名
    }
}

class 地址 {
    var 建筑名称: String?
    var 建筑编号: String?
    var 所在街道: String?
    
    func 建筑标识符() -> String? {
        if 建筑名称 != nil {
            return 建筑名称
        } else if let 建筑号码 = 建筑编号, let 街道 = 所在街道 {
            return "\(建筑号码) \(街道)"
        } else {
            return nil
        }
    }
}

class 住所 {
    var 房子 = [房间]()
    var 房间数: Int {
        return 房子.count
    }
    
    subscript(i: Int) -> 房间 {
        get {
            return 房子[i]
        }
        set {
            房子[i] = newValue
        }
    }
    
    func 打印房间数() {
        print("房子总共有\(房间数)间。")
    }
    
    var 地址: 地址?
}

class 用户 {
    var 住址: 住所?
}


let 小驴儿 = 用户()
if let 房间数量 = 小驴儿.住址?.房间数 {
    print("小驴儿的家有\(房间数量)套房子。")
} else {
    print("不知道小驴儿家有几套房。")
}

let 某个地址 = 地址()
某个地址.建筑编号 = "29"
某个地址.所在街道 = "国顺东路"
小驴儿.住址?.地址 = 某个地址

func 创建地址() -> 地址 {
    print("开始创建地址。")
    
    let 创建地址 = 地址()
    创建地址.建筑编号 = "29"
    创建地址.所在街道 = "安波路"
    
    return 创建地址
}

小驴儿.住址?.地址 = 创建地址()

if 小驴儿.住址?.打印房间数() != nil {
    print("能够打印房间数。")
} else {
    print("不可能打印出房间数。")
}

if (小驴儿.住址?.地址 = 某个地址) != nil {
    print("能够打印房间数。")
} else {
    print("不可能打印出房间数。")
}

if let firstRoomName = 小驴儿.住址?[0].房间名 {
    print("第一个房间名是\(firstRoomName)。")
} else {
    print("获取不到第一个房间名。")
}
