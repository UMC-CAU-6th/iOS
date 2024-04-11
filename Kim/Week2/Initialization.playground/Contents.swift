import UIKit

//타입의 저장된 프로퍼티에 초기값을 설정하고 초기 설정을 수행
/*저장된 프로퍼티에 초기값 설정*/
//클래스와 구조체는 해당 클래스, 구조체의 인스턴스가 생성될 때까지 모든 저장된 프로퍼티에 적절한 초기값을 반드시 설정해야 함
/*초기화 구문(Initializers)*/
/*
init() {
    // perform some initialization here
}
 */
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
/*기본 프로퍼티 값*/
struct Fahrenheit2 {
    var temperature = 32.0
}

/*초기화 구문 사용자화(Customizing Initialization)*/
/*초기화 파라미터*/
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
/*
인수 라벨을 사용하지 않고 초기화 구문을 호출할 수 없음
let veryGreen = Color(0.0, 1.0, 0.0)
*/
/*인수 라벨 없는 초기화 구문 파라미터*/
//초기화 구문 파라미터에 인수 라벨 사용을 원치 않을 경우 명시적으로 인수 라벨 대신 _를 작성
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
/*옵셔널 프로퍼티 타입*/
class SurveyQuestion {
    var text: String
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
/*초기화 동안 프로퍼티 상수 할당*/
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

/*기본 초기화 구문(Default Initializers)*/
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
/*구조체 타입에 대한 멤버별 초기화 구문*/
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height) //Prints "0.0 2.0"
let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height) //Prints "0.0 0.0"

/*값 타입을 위한 초기화 구문 위임*/
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
let basicRect = Rect() //origin (0.0, 0.0), size (0.0, 0.0)
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))

/*클래스 상속과 초기화(Class Inheritance and Initialization)*/
/*지정된 초기화 구문과 편의 초기화 구문*/
/*
 init(<#parameters#>) {
    <#statements#>
 }
 convenience init(<#parameters#>) {
    <#statements#>
 }
 */
/*클래스 타입에 대한 초기화 구문 위임*/
//규칙 1: 지정된 초기화 구문은 상위 클래스로 부터 지정된 초기화 구문을 호출해야 한다.
//규칙 2: 편의 초기화 구문은 같은 클래스로 부터 다른 초기화 구문을 호출해야 한다.
//규칙 3: 편의 초기화 구문은 궁극적으로 지정된 초기화 구문을 호출해야 한다.
/*초기화 구문 상속과 재정의*/
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
/*자동 초기화 구문 상속*/
//규칙 1: 하위 클래스가 지정된 초기화 구문을 정의하지 않았으면 자동으로 상위 클래스에 지정된 초기화 구문을 모두 상속한다.
//규칙 2: 하위 클래스가 규칙 1에 따라 상속하거나 정의의 부분으로 사용자 정의 구현을 제공하여 모든 상위 클래스 지정된 초기화 구문의 구현을 제공하면 모든 상위 클래스 편의 초기화 구문을 자동으로 상속한다.
/*지정된 초기화 구문과 편의 초기화 구문 동작*/
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

/*실패 가능한 초기화 구문*/
let wholeNumber: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
//초기화 실패
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
/*열거형을 위한 실패 가능한 초기화 구문*/
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
/*원시값을 가진 열거형에 대한 실패 가능한 초기화 구문*/
enum TemperatureUnit2: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
/*초기화 실패 전파(Propagation of Initialization Failure)*/
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
//초기화 실패
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
/*실패 가능한 초기화 구문 재정의*/
//실패 가능한 초기화 구문을 실패 불가능한 초기화 구문으로 재정의 할 수 있지만 그 반대는 불가능
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
/*init! 실패 가능한 초기화 구문*/

/*필수 초기화 구문*/
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

/*클로저 또는 함수를 사용하여 기본 프로퍼티 값 설정*/
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1)) // Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7)) // Prints "false"
