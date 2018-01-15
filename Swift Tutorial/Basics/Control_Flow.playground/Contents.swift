//: Playground - noun: a place where people can play

import UIKit

//for-in loop
//可用 "a...b" 來代表 a 到 b 的範圍(含b)，而 "a..<b" 代表 a 到 b-1 的範圍(不含b)
for index in 1...5 {
    print("\(index) time 5 is \(index * 5)")
}

for index in 1..<5 {
    print("\(index) time 5 is \(index * 5)")
}

//如果不需要用到 index，可以用 "_" 來忽略
for _ in 1...5 {
    print("Hello World")
}

//while loop
//while 在每次 loop 開始前檢查條件
var index = 1
while index <= 5 {
    print("\(index) time 5 is \(index * 5)")
    index += 1
}


