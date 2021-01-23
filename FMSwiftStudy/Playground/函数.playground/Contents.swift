import UIKit

/**
 函数在swift是一等公民，相比oc更灵活，函数可以作为参数、返回值、甚至可以函数嵌套函数，赋值给变量等
 注意点:
 1、省略参数标签
 2、默认参数值
 3、输入输出
 4、嵌套函数
 */

/**
 1、函数的定义与调用
 */
func greet(person: String) -> String { // 形参person
    let greeting = "hello," + person + "!"
    return greeting
}

print(greet(person: "Anna")) // 传入实参"Anna"

// 2、隐式返回的函数，只有一行return语句可以省略return，与get一样
func anotherGreet(person: String) -> String { // 形参person
    "hello," + person + "!"
}

print(anotherGreet(person: "Anna"))

/**
 3、参数标签、参数名称、省略参数标签
 
 每个函数参数都有一个参数标签和一个参数名称，默认情况下使用参数名称作为参数标签使用
 */
func someFunction(firstParamName: Int, secondParamName: Int) {
    // 不指定参数标签，默认参数标签就是参数名
}

// 指定第二参数的标签为from，参数名为hometown;
// 参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图。

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

// 忽略参数标签，使用下划线_代替明确的参数标签
// 如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
func someFunction(_ firstParamName: Int, secondParamName: Int) {
    // 不指定参数标签，默认参数标签就是参数名
    print("firstParam: \(firstParamName), secondParam : \(secondParamName)")
}

someFunction(1, secondParamName: 2)

/**
 4、默认参数值
 
 你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（DeafultValue）。当默认值被定义后，调用这个函数时可以忽略这个参数。
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
    print("first: \(parameterWithoutDefault), second = \(parameterWithDefault)")
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12

/**
 5、可变参数
 
 一个可变参数（variadicparameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。
 
 注意：一个函数最多只能拥有一个可变参数。
 */


/// 求平均值
/// - Parameter numbers: 可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5, 6))


/**
 6、输入输出参数
 
 函数参数默认是常量，试图在函数体中更改参数值将会导致编译错误，如果需要修改就应该把参数定义为inout
 
 注意：输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
 */
func swapTwoInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var a = 10
var b = 11
swapTwoInts(a: &a, b: &b) // 调用的时候要传地址过来
print("now a = \(a), b = \(b)")


/**
 7、函数类型
 
 每个函数都有特定的函数类型，函数类型由函数的参数类型和返回类型组成
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/*
 addTwoInts 和 multiplyTwoInts 函数的类型为(Int, Int) -> Int;
 可以解读为: “这个函数类型有两个 Int 型的参数并返回一个 Int 型的值”。
 */

func printHelloWorld() {
    print("hello, world")
}
// printHelloWorld类型是() -> Void, 或者叫“没有参数，并返回 Void 类型的函数”

/*
 7.1 使用函数类型
 */
var mathFunction: (Int, Int) -> Int = addTwoInts

/*
 7.2 函数类型作为参数类型
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

/**
 7、3 函数类型作为返回类型
 */
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


/**
 8、嵌套函数
 */
func otherChooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var value = -4
let moveToZero = otherChooseStepFunction(backward: value > 0)
// moveNearerToZero now refers to the nested stepForward() function
while value != 0 {
    print("\(value)... ")
    value = moveToZero(value)
}
print("zero!")
