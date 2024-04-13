import UIKit

// 구조체와 클래스
// 구조체와 클래스 비교 -> https://bbiguduk.gitbook.io/swift/language-guide-1/structures-and-classes
// 1. 정의 구문
struct SomeStructure {
    // structure definition goes here
}
class SomeClass {
    // class definition goes here
}

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 2. 구조체와 클래스 인스턴스
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 3. 프로퍼티 접근
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 변수 프로퍼티에 새로운 값을 할당하기 위해 점 구문 사용
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"

// 4. 구조체 타입에 대한 멤버별 초기화 구문
let vga = Resolution(width: 640, height: 480)

// 5. 구조체와 열거형은 값 타입(value type)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
// hd와 cinema는 완벽하게 다른 인스턴스 -> 서로 영향을 주지 않음!!
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"

// 열거형에서도 마찬가지
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)") // Prints "The current direction is north"
print("The remembered direction is \(rememberedDirection)") // Prints "The remembered direction is west"

// 6. 클래스는 참조 타입
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

// 7. 식별 연산자
// 클래스는 참조 타입이기 때문에 클래스의 같은 단일 인스턴스에 참조하는 여러개의 상수와 변수가 가능
// 2개의 상수 또는 변수가 클래스의 같은 인스턴스를 참조하는지 확인하기 위한 2가지 식별 연산자
// 1) 동일 인스턴스 (Identical to) (===), 2) 동일하지 않은 인스턴스 (Not identical to) (!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."

// 8. 포인터
