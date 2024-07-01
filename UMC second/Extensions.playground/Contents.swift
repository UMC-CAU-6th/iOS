import UIKit


/*확장
 :swift에서 확장은 기존 타입에 새로운 기능을 추가하거나 수정할 수 있도록 함.
 확장을 사용하여 클래스, 구조체, 열거형, 프로토콜 등의 기본 타입에 새로운 메서드, 계산된 프로퍼티, 초기화자, 서브스크립트 등을 추가할 수 있습니다. 또한, 기존의 타입에 속하지 않는 프로토콜을 채택할 수도 있습니다.
 */

/*확장구문
extension SomeType: SomeProtocol, AnotherProtocol {
    
}
*/

/*계산된 프로퍼티*/
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("\(oneInch)")
let threeFeet = 3.ft
print("\(threeFeet)")

//Double 타입 5개 프로퍼티 추가


/*초기화 구문*/
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))

//특정 중심점과 크기를 가지는 초기화 구문 제공
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

/*메서드*/
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
//repetitions라는 새로운 인스턴스 메서드 추가


/*인스턴스 메서드 변경*/
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()



/*중첩된 타입*/
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
//kind라는 인스턴스 프로퍼티를 Int에 추가


