import UIKit
//클래스는 구조체와 다르게 상속, 타입 캐스팅, 초기화 해제, 참조 카운팅이 가능함
/*정의 구문*/
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

/*구조체와 클래스 인스턴스*/
//인스턴스 생성 구문은 둘이 유사
let someResolution = Resolution()
let someVideoMode = VideoMode()
/*프로퍼티 접근*/
//인스턴스
print("The width of someResolution is \(someResolution.width)")
//클래스
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
/*구조체 타입에 대한 멤버별 초기화 구문*/
let vga = Resolution(width: 640, height: 480)

/*구조체와 열거형은 값 타입(Structures and Enumerations Are Value Types)*/
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide") //2048로 값 바뀜
print("hd is still \(hd.width) pixels wide") //기존 hd 값은 바뀌지 않음
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

/*클래스는 참조 타입(Classes Are Reference Types)*/
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)") //30.0
/*식별 연산자*/
//동일 인스턴스(===), 동일하지 않은 인스턴스(!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

/*포인터*/
//참조 타입의 인스턴스를 참조하기 위해 * 작성할 필요 X
