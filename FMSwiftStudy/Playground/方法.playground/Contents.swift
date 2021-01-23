import UIKit

/**
 1、方法就是与具体类型（类、结构体、枚举）相关联的函数
 */
class Counter {
    var count = 0
    // 实例方法
    func increment() {
        count += 1 // 隐式使用self
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

/**
 2、self属性
 
 类型的每个实例都有一个隐含的self属性，表示实例变量本身
 
 注意：不必在代码中经常写self。不论何时，只要在一个方法中使用一个已知的属性或者方法名称，如果你没有明确地写 self，Swift 假定你是指当前实例的属性或者方法。
 
 只有当函数的参数名和属性名一样是，由于参数名享有优先权，这个时候才需要显示的使用self来区分
 */
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x // 显示使用self
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) { // mark method 'mutating' to make 'self' mutable
        x += deltaX
        y += deltaY
    }
    
    // 与上面方法等价，通过改写self，实现一样的功能
//    mutating func otherMoveBy(x deltaX: Double, y deltaY: Double) {
//        self = Point(x: x + deltaX, y: y + deltaY)
//    }
}
//let somePoint = Point(x: 4.0, y: 5.0) // 错误，注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性。

// 改成var定义结构体变量，而不是用let定义常量，因为Point方法修改了属性，使用常量编译报错
var somePoint = Point(x: 4.0, y: 5.0) // 错误，注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性。

if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

somePoint.moveBy(x: 2.0, y: 3.0)
print("now x move to \(somePoint.x), y move to \(somePoint.y)")

/**
 3、在实例方法中修改值类型
 
 结构体和枚举是值类型，默认情况下，值类型的属性不能在它的实例方法中被修改。
 如果需要修改，可以为方法选择可变mutating行为，然后就可以在方法内部修改它的属性。
 
 如上面的mutating func moveBy(x deltaX: Double, y deltaY: Double)方法
 */

/**
 4、类方法（类型方法）
 
 与实例方法不同，类方法由类型本身调用，在方法前加class或static表示，区别就是class定义的方法子类可以重写，而static则不能
 */
class A {
    class func aMethod() { // 子类如果要重写，需要使用class描述，使用static描述会报错cannot override static method
        print("A method call")
    }
}

class B: A {
    override class func aMethod() { // 重写父类方法
        print("B method call")
    }
}

B.aMethod()

/**
 5、忽略返回值
 */
class Player {
    static var count = 1
    
    @discardableResult // 忽略返回值不产生编译警告
    static func play() -> Int {
        count += 1
        return count
    }
}

Player.play()
print("now count = \(Player.count)")
