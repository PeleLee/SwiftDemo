import UIKit

func myPrint(_ info: String) {
    print("🐤🐤🐤------", info)
}

//1
myPrint("为类型转换定义类层次")

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// library 为 [MediaItem] 类型
let library = [
    Movie(name: "一秒钟", director: "张艺谋"),
    Song(name: "半兽人", artist: "Jay"),
    Movie(name: "杀人回忆", director: "奉俊昊"),
    Song(name: "编号89757", artist: "JJ"),
    Song(name: "1874", artist: "Eason")
]

// 2
myPrint("检查类型")

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs.")

// 3
myPrint("向下转型")

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

// 4
myPrint("Any 和 AnyObject")

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(3.14159)
things.append("hello")
// 元组
things.append((3.0, 5.0))
things.append(Movie(name: "信条", director: "诺兰"))
// 闭包
things.append({(name: String) -> String in "Hello, \(name)"})

for thing in things {
    switch thing {
    case let someString as String:
        print("\(someString) is a string.")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y).")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else.")
    }
}

// 5
myPrint("Any 承载可选值")

let optionalNumber: Int? = 3
// 有警告
//things.append(optionalNumber)
// 没有警告
things.append(optionalNumber as Any)
