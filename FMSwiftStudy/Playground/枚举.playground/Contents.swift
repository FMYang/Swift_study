import UIKit

/**
 swift枚举
 
 oc中枚举只能是整形值，swift中可以是字符串、字符，或是一个整型值或浮点数
 
 此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体（unions）和变体（variants）。你可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值。
 在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，例如计算属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵循协议（protocols）来提供标准的功能。
 */

/**
 
 */
enum ErrorReson: String { // 如果不指定枚举类型，是不能设置原始值的
    case dataIsNil = "raw" // 不指定原始值，默认原始值与枚举值一样
    case noNetwork
    case serviceError
}

print(ErrorReson.dataIsNil.rawValue) // 原始值
print(ErrorReson.dataIsNil) // 枚举值

// 与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的类型
enum ItemType {
    case home
    case mine
    
    // 枚举值的计算属性
    var title: String {
        switch self {
        case .home:
            return "home"
        case .mine:
            return "mine"
        }
    }
    
    // 枚举值的实例方法
    func itemData() -> (String, String) {
        switch self {
        case .home:
            return ("home", "home.png")
        case .mine:
            return ("mine", "mine.png")
        }
    }
}

print(ItemType.home.itemData())
var i = ItemType.home // 赋值后i已经确定是ItemType类型了，再次赋值可以省略ItemType
i = .mine
print(i)

// 遍历枚举，如果枚举遵守CaseIterable协议，可以遍历枚举
enum A: CaseIterable {
    case a
    case b
    case c
}
print(A.allCases.count)

/*
 关联值
 */
enum API {
    case list(page: Int, pageSize: Int)
}

extension API {
    // 只读计算属性的声明可以去掉 get 关键字和花括号：
    var params: [String: Int]? {
        switch self {
        case let .list(page, pageSize):
            return ["page": page, "pageSize": pageSize]
        default:
            return nil
        }
    }
    
    var path: String {
        return "list"
    }
}

func fetchList(api: API) {
    let param = api.params;
    let path = api.path;
    
    print("path: \(path), params: \(param)")
}

fetchList(api: API.list(page: 1, pageSize: 10))

print(API.list(page: 1, pageSize: 10).params)


// @unknown defalt

enum DeviceType {
    case iphone
    case android
}

let devicetype: DeviceType = .iphone
switch devicetype {
case .iphone:
    print("iphone")
//case .android:
//    print("android")
@unknown default:
    break
}

/*
@unknown defalt 和 default的区别：

@unknown defalt 需要穷举完所有枚举，否则报错
 
 如果需要穷举完所有枚举，使用@unknown default，只需要处理部分枚举用default
*/
