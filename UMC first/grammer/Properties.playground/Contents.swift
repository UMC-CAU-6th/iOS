import UIKit

/*저장된 프로퍼티*/
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6


/*상수 구조체 인스턴스의 저장된 프로퍼티*/
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

//let으로 상수선언을 하면 firstvalue가 프토퍼티변수지만, 프로퍼티 변경 불가능
//클래스는 가능?

/*지연 저장된 프로퍼티 */

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//지연저장



/*계산된 프로퍼티*/

struct Point 
{
    var x = 0.0, y = 0.0
}
struct Size 
{
    var width = 0.0, height = 0.0
}
struct Rect 
{
    var origin = Point()
    var size = Size()
    var center: Point {
        get 
        {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) 
        {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//center는 중심점 계산하고 반환함
//set은 받아와서 업데이트

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
print("\(square.origin.x), \(square.origin.y))")



/*짧은 getter, setter선언 */
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}



/*읽기전용 계산되 프로퍼티*/
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
//setter없고 getter만 있는 계산된 프로퍼티

/*프로퍼티 관찰자*/
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
//이거 공부해보자


/*프로퍼티 래퍼*/
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}



//음.. 다시공부해보자
