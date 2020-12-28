import UIKit

/**
 map 和 flatmap
 
 map：对数组中的每个元素应用变换后，返回一个新的数组
 
 flatMap vs map
 相同点：都可对每个元素引用变换后返回一个新的数组
 区别：
 1、flap可过滤nil值，及对可选值拆包
 2、flatMap可对多维数组降维
 */

var arr = [1, 2, 3, 4]
let transformArr = arr.map { $0 * 2 }
print(transformArr)


var a = [[1,2], [3,4]]
// 将二维数组降维一维数组
let newa = a.flatMap { $0 }
print(newa)

// 使用flatmap操作二维数组
let aa = a.flatMap { $0.map { $0 * 2 } }
print(aa)

// 过滤空和拆包
var b1: Int? = 4
var b2: Int? = 5
var b3: Int? = nil
var bb = [b1, b2, b3]
print(bb)

let newB = bb.flatMap { $0 }
print(newB)

/*
 filter 过滤数组
 */
let newArr = arr.filter { $0 % 2 == 0 }
print(newArr)

/*
 reduce
 */

/*
 sort
 */
