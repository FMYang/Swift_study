import UIKit

/*
 1.存储属性
 
 简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）。
 */
var str = "Hello Swift"

/**
 1.2 延时存储属性
 
 延时加载存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延时加载存储属性。
 */

/*
 2.计算属性
 计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
 
 注意:
 必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。
 */
var userName: String? {
    get {
        return UserDefaults.standard.object(forKey: "userName") as? String
    }
    // 指定传入的新值的名称为xx，如果不知道默认可通过newValue获取新值
//    set(xx) {
//        UserDefaults.standard.set(xx, forKey: "userName")
//        UserDefaults.standard.synchronize()
//    }
    set {
        UserDefaults.standard.set(newValue, forKey: "userName")
        UserDefaults.standard.synchronize()
    }
}

userName = "lucky"
print("value = \(userName ?? "nil")")


/*
 3.只读计算属性
 
 只有 getter 没有 setter 的计算属性叫只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
 
 只读计算属性的声明可以去掉 get 关键字和花括号：
  */
var contentWidth: Float? {
    get {
        Float(UIScreen.main.bounds.size.width - 10) // 省略return，如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果。
    }
}

var params: String {
    return "只读计算属性的声明可以去掉 get 关键字和花括号"
    
    // 这里是完整写法
//    get {
//        return "只读计算属性的声明可以去掉 get 关键字和花括号"
//    }
}

print("width = \(contentWidth)")
print("params = \(params)")


// 4.属性观察器
var password: String = "000" {
    willSet {
        print("密码将要修改成\(newValue)")
    }
    didSet {
        print("密码已经修改成\(password)了")
    }
}

password = "123"
print("password = \(password)")

/*
 5、属性包装器
 */











/**
 6、延迟存储属性
 
 延迟存储实例属性：
 
 ** 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。

 延迟存储类属性：
 
 ** 跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
 
 存储型*类属性*是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。
 
 */

class FileParse {
    init() {
        print("parse file")
    }
}
 
class LazyTest { // Lazy is only valid for members of a struct or class
    let queue = DispatchQueue(label: "com.test.queue", attributes: .concurrent)

    // 延迟存储实例属性
    lazy var parse = FileParse()
 
    // 类属性
    static var name = "存储型类属性"

    // 多线程访问延迟存储属性，看会初始化几次
    func test() {
        for _ in 1...100 {
            queue.async {
                print("\(Date()) thread = \(Thread.current), 访问延时存储属性 \(self.parse)")
            }
        }
    }
}

//let lazytest = LazyTest()
//lazytest.test() // 测试多条线程同时访问实例存储属性，看会初始化几次（如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。）


/**
 单例，利用存储型类属性只初始化一次的特性实现
 */
class DataManager: NSObject {
    // 即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。
    static let sharedManager = DataManager()
    private override init() { super.init() }
}

class Manager {
    static let shared = Manager()
    private init() {}
}

//var swiftInt = 1
//var swiftString = "string"
//var arr: [Any] = []
//arr.append(swiftInt)
//arr.append(swiftString)
//print(arr)
//
//// 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
//// 混合（多种类型）集合类型不能正确的被推断，需要显示指定为[Any]，或转换为[Any]
//let a = [1, "2"] as [Any]
//print(a)
