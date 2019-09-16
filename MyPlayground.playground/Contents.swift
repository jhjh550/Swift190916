// 박재현 jhjh550 @gamil.com
import UIKit

var str: String = "Hello, playground"
let abc: Int = 1234

// 범위 연산자
1...5   // 1,2,3,4,5
1..<5   // 1,2,3,4
//1>..5

for _ in 1...5 {
//    print(i)
    print("hello world")
}

// while
var n = 1
while n < 1000 {
    n = n + 1
}
repeat {
    n = n + 1
}while n < 2000
print(n)

// if
let adultAge = 19
let age = 20
if age < adultAge{
    print("you are not adult")
}

// switch
switch age {
case 1...18:
    print("you are not adult")
case 19:
    print("hello world")
default:
    print("you are adult")
}

// 배열
var cities = ["Seoul", "LA", "Tokyo"]
var temp = [1,2,4]

for city in cities{
    print(city)
}
var list = [String]()
list.append("hello")
list.append("world")
list.insert("swift", at: 1)

var alphabet = ["a", "b", "c", "d", "e"]
alphabet[3]
alphabet[0...2]
alphabet[1...2] = ["1", "2", "3"]
alphabet

// Set
var genre: Set = ["Classic", "Rock"]
genre.insert("Ballade")

// Tuple
let myTuple = ("a", "b", 1)
myTuple.0

let (aa, bb, cc) = myTuple
aa

// Dictionary
var capital = ["kr":"seoul", "en":"london"]
capital["kr"]
var capital2 = [String:String]()
capital2["kr"] = "서울"
capital2.updateValue("런던", forKey: "en")
capital2

for (_, value) in capital2{
    print(value)
}





