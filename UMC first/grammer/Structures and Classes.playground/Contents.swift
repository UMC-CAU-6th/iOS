import UIKit

//구조체와 클래스는 Swift에서 데이터를 모델링하고 구현하는 데 사용되는 두 가지 주요 타입
//보통 구조체를 많이쓴다. 클래스는 복잡도 증가?

//프로퍼티 : 프로퍼티는 클래스, 구조체 또는 열거형과 같은 타입에 속하는 변수 또는 상수를 말합니다. 이것들은 해당 타입의 인스턴스에 대한 정보를 저장하거나 제공합니다.

//인스턴스 : 인스턴스는 클래스, 구조체 또는 열거형과 같은 타입에서 생성된 실제 객체를 나타냅니다. 인스턴스는 해당 타입의 프로퍼티에 액세스하고 해당 타입의 메서드를 호출할 수 있습니다.


/*정의 구문*/
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
let someResolution = Resolution()
let someVideoMode = VideoMode()
//인스턴스 생성 구문

/*프로퍼티 접근*/


print("The width of someResolution is \(someResolution.width)")
//.으로 접근

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Videomode의 resolution프로퍼티에 width프로퍼티 접근

someVideoMode.resolution.width = 1280
//변수 프로퍼티에 새로운 값 할당

/*구조체 타입에 대한 멤버별 초기화 구문*/
let vga = Resolution(width: 640, height: 480)


/*구조체와 열거형은 값 타입*/
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd


/*클래스는 참조타입*/
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//무슨 차이일까?
/*
 구조체 : 값타입은 인스턴스의 복사본이 전달됨. 각각이 독립적으로 존재하며 영향을 끼치지 않음
 클래스 : 여러 변수가 동일한 인스턴스를 가르킬 수 있으며, 공유할 수 있다.
 */


/*식별 연산자*/
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// ===: 동일, !== 동일 x
