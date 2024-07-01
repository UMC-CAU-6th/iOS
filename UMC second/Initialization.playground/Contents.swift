import UIKit

/*초기화*/

/*저장된 프로퍼티에 초기값 설정*/
//클래스, 구조체는 초기값을 반드시 설정해야 함.

/*초기화 구문*/

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")


/*초기화 구문 사용자화*/
// 초기화 파라미터
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


/*파라미터 이름과 인수 라벨*/
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

/*let veryGreen = Color(0.0, 1.0, 0.0)
컴파일 에러*/


/*옵셔널 프로퍼티 타입*/
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."


//SurveyQuestion이 초기화 될때 nil값 할당


/*기본 초기화 구문*/
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


/*구조체 타입에 대한 멤버별 초기화 구문*/
/*struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


let zerobytwo = Size(height: 2.0)
let zeroByzero = Size()*/
// 0.0, 2.0 & 0.0 0.0


/*값 타입을 위한 초기화 구문 위임*/

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}



/*클래스 상속과 초기화*/

//지정된 초기화 구문과 편의 초기화 구문
/*
 
 지정된 초기화
 init(parameter) {
 }
 
 편의 초기화
 convenience init(parameters) {
 }
 */


/*초기화 구문 상속과 재정의*/
class vehicle {
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard: vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
