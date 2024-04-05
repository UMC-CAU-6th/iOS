import UIKit

// 열거형 : 리스트의 가능한 값으로 정의한 사용자 정의 타입을 모델링
// 1. 열거형 구문
enum SomeEnumeration {
    // enumeration definition goes here
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}
// 한 줄로 표기도 가능
enum Planet {case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune}
// 각 열거형의 정의는 새로운 타입으로 정의! 대문자로 시작하는 이름(CompassPoint, Planet)이 타입!
var directionToHead = CompassPoint.west
// 유추도 가능
directionToHead = .east

// 2. 스위치 구문에서 열거형 값 일치
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// default 케이스 제공 가능
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// 3. 열거형 케이스 반복
// 열거형의 모든 케이스를 수집 -> 열거형 이름 뒤에 : CaseIterable 을 작성하여 활성화
// allCases 프로퍼티로 모든 케이스를 수집하고 방출
enum Beverage: CaseIterable { case coffee, tea, juice}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available") //Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}

// 4. 연관된 값 : 케이스 값과 함께 다른 타입의 값을 저장할 수 있는 것이 유용, 이 추가적인 정보가 '연관된 값'
// 예시) 두 타입의 바코드를 정의하는 열거형
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// 관련 값을 스위치 구문의 일부로 추출, switch 케이스의 본문 내에서 사용하기 위해 상수 or 변수로 각 연관된 값 추출
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// 열거형 케이스를 위한 연관된 값 모두 상수로 추출하거나 변수로 추출하려면 간결하게 케이스 이름 앞에 let 또는 var 을 선언
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// 5. 원시값 : 동일한 타입의 기본값
// 예시) 명명된 열거형 케이스와 함께 원시 ASCII 값을 저장하는 예
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// 암시적으로 할당된 원시값
// 원시값을 설정하지 않으면 Swift는 자동적으로 값을 할당
// 예를 들어 정수를 원시값으로 사용하면 각 케이스의 암시적 값은 이전 케이스보다 하나씩 증가시킨다
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// -> Planet2.mercury 는 명시적으로 원시값 1 을 가지고 Planet.venus 는 암시적으로 원시값 2 를 가집니다.

enum CompassPoint2: String {
    case north, south, east, west
}
// -> CompassPoint.south 는 "south" 의 암시적 원시값을 가지고 있다.

// rawValue : 열거형 케이스의 원시값에 접근할 수 있다.
let earthsOrder = Planet2.earth.rawValue // earthsOrder is 3

let sunsetDirection = CompassPoint2.west.rawValue // sunsetDirection is "west"

// 원시값으로 초기화
let possiblePlanet = Planet2(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus

// 11의 위치로 Planet2에서 행성을 찾는다면, 원시값 초기화로 부터 반환된 옵셔널 Planet 값은 nil
let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for human")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"


// 6. 재귀 열거형 : 열거형 케이스에 하나 이상의 연관된 값으로 열거형의 다른 인스턴스를 가지고 있는 열거형
