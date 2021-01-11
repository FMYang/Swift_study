import UIKit

/**
 访问控制可以限定其它源文件或模块对你的代码的访问。这个特性可以让你隐藏代码的实现细节，并且能提供一个接口来让别人访问和使用你的代码。
 
 访问级别：
 1、open 和 public 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，你会使用 open 或 public 级别来指定框架的外部接口。
 2、internal 级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问。
 3、fileprivate 限制实体只能在其定义的文件内部访问。
 4、private 限制实体只能在其定义的作用域，以及同一文件内的 extension 访问。
 
 访问级别范围排序，从高到低为open > public > internal > filePrivate > private
 
 open 和 public的区别是：
 open修饰的类可被其他模块继承，public则不能继承
 
 Setter 的访问级别可以低于对应的 Getter 的访问级别，这样就可以控制变量、属性或下标的读写权限。
 
 使用private(set)修饰的属性，只能在当前作用域内修改值，外部不可访问，相当于只读属性.
 例如定义如下变量public private(set) var value: Int = 0，getter方法的访问级别是public的，但setter方法是private的。
 */

struct Article {
    private(set) var numberOfEdits = 0
    // 存储属性value
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var article = Article()
// article.numberOfEdits = 5 // error: cannot assign to property: 'numberOfEdits' setter is inaccessible
article.value = "The article will be editing"
article.value += "numberOfEdits + 1"
article.value += "numberOfEdits + 1"
print("The number of edits is \(article.numberOfEdits)")
