import UIKit

// 值类型和引用类型

struct Remark {
    var info: String = "不要辣"
}

let remark = Remark()
var arr = [Remark]()
arr.append(remark)

var newRemark = arr[0]
newRemark.info = "不要筷子"

// 值类型的copy on write
print(remark.info, newRemark.info) // Remark如果是class都是不要筷子，如果是struct是不要辣 不要筷子

// 深拷贝、浅拷贝
