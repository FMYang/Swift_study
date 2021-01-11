/**
 lazy
 
 @objc dynamic
 
 KVO （运行时）
  
 访问控制
 
 可选值
  
 as、try
  
 where
 
 guard let 、 if let
 
 AnyObject
 
 闭包
 
 protocol 和 weak
 
 必要构造器
 */

var arr = [1, 2, 3, 4]
for a in arr {
    print(a)
}

// $0是Swift内建的用来代表参数的简写
arr.map { print($0) }
