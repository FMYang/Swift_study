/**
 lazy
 
 @objc dynamic
 
 KVO写法
 
 $0
 
 访问控制
 
 可选值
 
 comcatmap
 
 as、try
 
 扩展、扩展里面实现init方法的影响
 
 where
 
 guard let 、 if let
 
 AnyObject
 
 闭包
 */

var arr = [1, 2, 3, 4]
for a in arr {
    print(a)
}

// $0是Swift内建的用来代表参数的简写
arr.map { print($0) }
