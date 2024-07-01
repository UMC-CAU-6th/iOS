import UIKit


/*타입 캐스팅은 인스턴스의 타입을 확인하거나, 다른 타입으로 변환할 때 쓰인다.
 class Animal {}
 class Dog: Animal {}

 let animal = Dog()
 if animal is Dog {
     print("This animal is a dog.")
 }
//is 연산자로 특정 타입인지 확인.
 
 let dog = animal as? Dog
 if let dog = dog {
     print("Successfully downcasted to Dog.")
 }

 //as연산자로 다운캐스팅
 
 let anotherAnimal = Animal()
 let anotherDog = anotherAnimal as? Dog
 if anotherDog == nil {
     print("Failed to downcast to Dog.")
 }
 
 */

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// library에 저장된 항목은 movie와 song인스턴스이지만, 배열의 항목을 반복하면 Mediaterm으로 받는다. > 다른 타입으로 받거나 다운캐스트를 해야한다.


/*타입 검사*/
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

/*다운 캐스팅*/
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
