import UIKit

class MediaItem {
    var item = 4
}

class Movie: MediaItem {
    var movie = 1
}

class Song: MediaItem {
    
}


let movie = Movie()
print(type(of: movie))
print(movie is MediaItem)
print(movie is Movie)
let newMovie = movie as? MediaItem // 向上转型丢掉子类细节
// newMovie不再有movie属性
print(movie.item)

var item = MediaItem()
print(item.item)
var newItem = item as? Movie // 向下转型
newItem?.movie = 3
print(newItem?.item)

let aItem = Movie()
let aMovie = aItem as Movie
print(aMovie.item, aMovie.movie)

let i: Int = 0
let ii = i as? String // Int转String必然失败，强转(as!)崩溃，所以应该用可选转换as?，用as编译期报错（提示：cannot convert value of type 'Int' to type 'String'）
print("ii=\(ii)")


/**
 as as? as! 区别
 as：表示可保障的类型转换，确定能转换成功的时候使用
 as?：可选转换，如果失败返回nil
 as!：强制转换，转换失败会崩溃
 */
