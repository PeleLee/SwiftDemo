import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------------------------------", info)
}

// 1
myPrint("自动引用计数实践")

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Apple")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// 2
myPrint("循环强引用")

class Person_2 {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person_2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

/*var john: Person_2?
var unit4A: Apartment?

john = Person_2(name: "John")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil*/

// 3
myPrint("弱引用")

class Person_3 {
    let name: String
    var apartment: Apartment_3?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment_3 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person_3?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var tom: Person_3?
var unit5A: Apartment_3?

tom = Person_3(name: "Tom")
unit5A = Apartment_3(unit: "5A")

tom!.apartment = unit5A
unit5A!.tenant = tom

tom = nil
unit5A = nil

// 4
myPrint("无主引用")

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var jimy: Customer?

jimy = Customer(name: "Jimy")
jimy!.card = CreditCard(number: 1234_5678_9012_3456, customer: jimy!)

jimy = nil

// 5
myPrint("无主引用和隐式解包可选值类型")

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "中国", capitalName: "北京")
print("\(country.name)的首都是\(country.capitalCity.name)。")

// 6
myPrint("闭包的循环强引用")

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
print(heading.asHTML())

let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)<\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, Swift.")
print(paragraph!.asHTML())

// 不会释放
paragraph = nil

// 7
myPrint("解决闭包的循环强引用")

class HTMLElement_2 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph_2: HTMLElement_2? = HTMLElement_2(name: "p", text: "Hello, Swift.")
print(paragraph_2!.asHTML())

paragraph_2 = nil
