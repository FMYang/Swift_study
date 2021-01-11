import UIKit

var str = "Hello, playground"

let queue = DispatchQueue(label: "com.test.queue", attributes: DispatchQueue.Attributes.concurrent)

//queue.async {
//    print(Thread.current)
//    str = "1"
//}

//for i in 1...3 {
print(str)
    queue.async {
        str = "222"
    }
    print(str)
//}


var swiftInt = 1
var swiftString = "string"
var arr: [Any] = []
arr.append(swiftInt)
arr.append(swiftString)
print(arr)

// 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
// 混合（多种类型）集合类型不能正确的被推断，需要显示指定为[Any]，或转换为[Any]
let a = [1, "2"] as [Any]
print(a)
