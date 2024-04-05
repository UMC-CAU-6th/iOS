import UIKit

/*열거형 구문*/

enum compassPoint 
{
    case north
    case south
    case east
    case west
}


enum Planet 
{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//열거도 가능

var directionToHead = compassPoint.west

directionToHead = .east

/*스위치 구문에서 열거형 값 일치*/
directionToHead = .south
switch directionToHead {
case .north:
    print("!")
case .south:
    print("ㄴ")
case .east:
    print("ㄹ")
case .west:
    print("ㅁ")
}



/*열거형케이스 반복*/
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
//3개 다 나옴

/*연관된 값*/
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
//바코드 정의하는 열거형


/*원시값*/
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//ASCII값을 저장하는


/*암시적으로 할당된 원시값*/
enum planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//mecury는 1, venus는 2


enum CompassPoint: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint.west.rawValue
//rawValue로 원시값 접근가능



/*원시값으로 초기화*/

let possibleplanet = planet(rawValue: 7)


let positionToFind = 11
if let somePlanet = planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("s")
    default:
        print("f")
    }
} else {
    print("\(positionToFind)")
}
//11

/*재귀 열거형*/

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

