import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("通过重写给成员提供更高的访问级别")

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}

// 2
myPrint("set 的访问级别修改")

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var tracked_00 = TrackedString()
//tracked_00.numberOfEdits = 0
print(tracked_00.numberOfEdits)
tracked_00.value = "你好"
print(tracked_00.numberOfEdits)

// 3
myPrint("get 与 set 设置不同的访问权限，且 set 比 get 低")

struct TrackedString_1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

// 4
myPrint("extension 中使用原类型的私有变量")

protocol SomeProtocol {
    func doSomething()
}

struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}

let struct_0 = SomeStruct()
struct_0.doSomething()
