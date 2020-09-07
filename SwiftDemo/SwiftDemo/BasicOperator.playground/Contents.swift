import UIKit

var str = "Hello, playground"
let dark = "🐤"


// 禁止值溢出
var intMax = Int.max
//intMax += 1
print(intMax)

// 单侧区间
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[2...] {
    print(name)
}
print(dark)

for name in names[..<2] {
    print(name)
}
print(dark)

for name in names[...2] {
    print(name)
}
print(dark)

// 半开区间是否包含某个特定值。
let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

