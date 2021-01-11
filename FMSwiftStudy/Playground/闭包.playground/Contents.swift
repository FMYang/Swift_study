import UIKit
import Foundation

/**
 在 函数 章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用如下三种形式之一：
 * 1.全局函数是一个有名字但不会捕获任何值的闭包
 * 2.嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 * 3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 
 Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
 * 利用上下文推断参数和返回值类型
 * 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
 * 参数名称缩写
 * 尾随闭包语法
 */

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// 1.使用函数作为参数
func backward(_ s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

// 2.使用内联闭包表达式优化
// ** 在内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外。
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)

// 3.根据上下文类型推断，可以省略参数类型、参数括号和返回值
/**
 因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：
 */
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// 4、函数只包含单一表达式，返回没有歧义，可以省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// 5、参数名称缩写省略参数名和in
/**
 swift为闭包提供了参数名称缩写的功能，可以使用$0，$1，$2顺序调用闭包参数
 */
reversedNames = names.sorted(by: { $0 > $1 })

// 6、尾随闭包，将表达式写在括号外，省略内联闭包的括号()
/**
 闭包表达式作为函数的最后一个参数时，可以将闭包表达式写在括号外，函数支持将其作为最后一个参数调用.
 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
 下面两个方法等价
 */
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

// 7、逃逸闭包
/**
 当一个闭包作为参数传到一个函数中，默认是不能在函数作用域外（函数返回后）调用的，如果需要在函数返回后调用，需要j将闭包标记为@escaping
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    // 闭包被加入函数作用域外的数组中，闭包逃逸了
    completionHandlers.append(completionHandler)
}
someFunctionWithEscapingClosure {
    print("call closure")
}
completionHandlers[0]()

// 8、自动闭包
/**
 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
 
 ** 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerProvider = { customersInLine.remove(at: 0) } // 闭包表达式移除数组的第一个元素
print(customersInLine) // 未执行闭包，不改变数组值
customerProvider()     // 执行闭包后
print(customersInLine) // 执行闭包后，第一个值被移除

// 接收显示闭包参数
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) }) // 未标记为@autoclosure的闭包，不能省略花括号

// 接收自动闭包参数，调用的时候省略闭包的花括号{}
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) // 标记为@autoclosure的闭包，可以省略花括号
