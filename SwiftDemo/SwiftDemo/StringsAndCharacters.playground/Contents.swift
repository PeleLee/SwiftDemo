import UIKit

// 多行字符串字面量
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop.
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
let multilineString2 = """
These are the
same.
"""
let multilineString3 = """
These are the \
same.
"""

// 多行缩进
let linesWithIndentation = """
        这行前面的空白会被忽略，因为是和"结束引号"前面空白长度一致。
            这行会有缩进，因为空白部分超出"结束引号"前面空白长度。
        这行前面的空白会被忽略，同第一行。
        """
print(linesWithIndentation)

// 特殊字符
// 使用Unicode位码来表示Unicode标量
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


// 多行中使用单引号
let test000 = """
"单引号使用
"""
print(test000)

// 多行中使用双引号
let test001 = """
""双引号使用""
"""
print(test001)

// 多行中使用三引号 使用了#"""不需要转义了
let test002 = """
\"""三引号使用\"""
"""
print(test002)

// 多行中超过三个引号
let test003 = """
"\"""超过三个引号的使用"\"""
"""
print(test003)

// 前后一个#
let test004 = #"Line 1 \n Line 2 \n Line 3"#
print(test004)

// 正常转义
let test005 = #"Line 1\#n Line 2 \n Line 3"#
print(test005)

let test006 = ##"Line 1 \##n Line 2 \##n Line 3"##
print(test006)

let test007 = #"Line 1_1 \u{24} Line1_2"#
print(test007)

let test008 = #"Line 1_1 \#u{24} Line 1_2"#
print(test008)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// 字符串是值类型
var test009 = "111"
var test010 = test009
test010 += "222"
print("009的值为"+test009)
print("010的值为"+test010)

// 通过字符初始化字符串
let catCharacter: Character = "🐱"
let catString1 = String(catCharacter)
print(catString1)

// 通过字符数组初始化字符串
let catCharacters: [Character] = ["C","a","t","!","🐱"]
let catString2 = String(catCharacters)
print(catString2)

// Character的 字形群
let eAcute: Character = "\u{E9}"
print(eAcute)
let combinedEAcute: Character = "\u{65}\u{301}"
print(combinedEAcute)

// 朝鲜字母
let precomposed: Character = "\u{D55C}"
print(precomposed)
let decomposed0: Character = "\u{1112}"
let decomposed1: Character = "\u{1161}"
let decomposed2: Character = "\u{11AB}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
print(decomposed)

// 字符群集的包围记号
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print(enclosedEAcute)

var printTagIndex = 11
let tag = "🐤🐤🐤"
func printTagPrefix() -> String {
    return tag + "\(printTagIndex)--"
}

// 字符数量
let test011 = "浣沙五村早上好🇨🇳"
print(printTagPrefix(),"test011 has \(test011.count) characters.")

// 字符串索引值
printTagIndex += 1
print(printTagPrefix(),"test011 startIndex is \(test011.startIndex) endIndex is \(test011.endIndex)")
print(test011[test011.startIndex])
print(test011[test011.index(before: test011.endIndex)])
print(test011[test011.index(after: test011.startIndex)])
print(test011[test011.index(test011.startIndex, offsetBy: 6)])

let greeting = "Guten Tag!"
printTagIndex += 1
print(printTagPrefix(), "greeting startIndex is \(greeting.startIndex) endIndex is \(greeting.endIndex)")

// indices
printTagIndex += 1
print(printTagPrefix())
for index in test011.indices {
    print("\(index): \(test011[index]) ")
}

// insert方法
var welcome = "hello"
printTagIndex += 1
print(printTagPrefix(), "insert相关打印")
// 插入单个字符
welcome.insert("!", at: welcome.endIndex)
print(welcome)
// 插入字符串
welcome.insert(contentsOf: "Morinig!", at: welcome.endIndex)
print(welcome)

// remove方法
printTagIndex += 1
print(printTagPrefix(), "remove相关打印")
// 删除单个
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)
// 删除范围内字符
let range = welcome.index(welcome.endIndex, offsetBy: -7)...welcome.index(before: welcome.endIndex)
welcome.removeSubrange(range)
print(welcome)

// 自字符串 SubString
let test012 = "Hello, world!"
let index012 = test012.firstIndex(of: ",") ?? greeting.endIndex
let beginning = test012[..<index012]

let newString = String(beginning)

printTagIndex += 1
print(printTagPrefix(), "SubString相关打印")
print(newString)

// 比较字符串是否相等
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    printTagIndex += 1
    print(printTagPrefix(), "比较字符串相等")
    print("These two strings are considered equal.")
}

// 外形相同，但语义不同
// 英文A
printTagIndex += 1
print(printTagPrefix(), "看似相等但语义不等")

let latinCapitalLetterA: Character = "\u{41}"
print(latinCapitalLetterA)
// 俄文A
let cyrillicCapitalLetterA: Character = "\u{0410}"
print(cyrillicCapitalLetterA)

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

// 字符串的Unicode表示形式
printTagIndex += 1
print(printTagPrefix(), "字符串的Unicode表示相关打印")

let dogString = "Dog\u{203C}🐶"

print("UTF-8形式:")
for codeUnit in dogString.utf8 {
    print("\(codeUnit)")
}

print("UTF-16形式:")
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}

print("Unicode标量形式:")
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
}
