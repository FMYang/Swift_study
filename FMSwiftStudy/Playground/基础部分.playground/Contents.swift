import UIKit

/*
 类型安全：swift是一个类型安全的语言。类型安全的语言可以让你清楚的知道代码要处理的值的类型。如果你的代码需要一个String，你绝对不可能不小心传进去一个Int.
 
 由于swift是安全的，所以它会在编译你的代码时进行类型检查，并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
 
 
 类型推断：并不是每次声明常量和变量的时候都需要显示指定类型。如果没有显示指定类型，swift会使用类型推断来选择合适的类型。
 */
var a: String // 类型注解
// a = 4 // cannot assign value of type 'Int' to type 'String'

var i = 4
print(i)

print("The current value = \(i)")


/*
 可选类型（Optional枚举）
 
 使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。
 */

/*
enum Optional<T> : LogicValue, Reflectable {
    case None
    case Some(T)
    init()
    init(_ some: T)

    /// Allow use in a Boolean context.
    func getLogicValue() -> Bool

    /// Haskell's fmap, which was mis-named
    func map<U>(f: (T) -> U) -> U?
    func getMirror() -> Mirror
}
 */

/*
 可选绑定
 
 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。if 和 while 语句，请参考 控制流。
 */

var constantName: String? = "jack"
if let name = constantName {
    print("name = \(name)")
} else {
    print("constantName is nil")
}
// 判断可选值constantName是否有值，有值就把值赋值给name

if constantName != nil {
    print(constantName)
}

