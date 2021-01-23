import UIKit

/**
 注意点：
 与oc不同，swift的初始化方法需要保证类型的所有属性都被初始化，所以初始化方法的调用顺序就很讲究。在某个子类中，初始化方法里语句的顺序并不是很随意的，我们需要保证在当前子类实例的成员初始化完成之后才能调用父类的初始化方法。
 
 一般来说，子类的初始化顺序是：
 1、设置子类自己需要的初始化参数
 2、调用父类的初始化方法，super.init()
 3、对父类中的需要改变的成员进行赋值
 
 如果没有第3步，第二部也可以省略，swift会隐身的加上super.init()
 */

/**
 概念：遍历构造器、指定构造器、必要构造器
 
 注意点一：
 1、为UIViewController的子类实现指定构造器，如init(name: String)
 
 方式一：
 使用便利构造器
 
 方式二：
 - 1、实现init(name: String) { super.init(nibName: nil, bundle: nil) } 调用父类的 指定 构造器init(nibName: nil, bundle: nil)
 - 2、重写父类的 必要 构造器required init?(coder: NSCoder)方法
 
 总结：
 继承实现NSCopying协议的类的子类，都必须实现NSCoding协议定义的必要构造器required init?(coder: NSCoder)方法，换句话说子类必须实现父类的必要构造器
 public protocol NSCoding {
     func encode(with coder: NSCoder)
     init?(coder: NSCoder) // NS_DESIGNATED_INITIALIZER
 }
 
 注意点二：
 指定构造器中必须在调用super.init前对所有的存储属性赋值，保证构造过程的完整，子类和父类都能正确完成初始化
 */

/**
 构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例使用前有个过程是必须的，它包括设置实例中每个存储属性的初始值和执行其他必须的设置或构造过程。
 
 1、存储属性的初始赋值：
 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
 */

struct Fahrenheit {
    var temperature: Double
    var name: String? // 可选存储属性，不赋值的话默认为nil，表示这个属性在构造过程设置为nil
    init() {
        temperature = 32.0 // 不可选的存储属性必须赋值初始值
    }
}

class A {
    var name: String = ""
}

class B: A {
    var hairColor: String
    override init() {
        hairColor = "red" // 要在父类初始化之前，给存储属性赋值初始值
//        super.init() // 如果没有对父类的属性赋值，这一步可以省略，系统会自动补上
        name = "new name" // 如果对父类的属性赋值了，super.init()不能省略
    }
}

print("======")
