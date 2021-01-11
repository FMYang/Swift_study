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
let ii = i as? String
print(ii)
