import UIKit

// 제어 흐름 -> 분기, 루프, 이른 종료

// 1. For-In 루프
// 배열 반복
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// 딕셔너리 반복
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// -> index는 let 선언 키워드 필요없이 암시적으로 선언

// 시퀀스로부터 각 값이 필요하지 않으면, 변수 이름의 위치에 언더버랄 사용하여 값 무시 가능
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//시계 에시
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
// 5문마다 눈금을 그리길 원한다면? -> stride() 함수를 통해 건너뛰기
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
// stride() -> 닫힌 범위도 가능
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

// 2. While 루프
/* while <#condition#> {
    <#statements#>
   }*/
// 뱀과 사다리 예시
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")

// 3. Repeat-While
/* repeat {
      <#statements#>
   } while <#condition#> */
// 뱀과 사다리 예시
let finalSquare2 = 25
var board2 = [Int](repeating: 0, count: finalSquare2 + 1)
board2[03] = +08; board2[06] = +11; board2[09] = +09; board2[10] = +02
board2[14] = -10; board2[19] = -11; board2[22] = -02; board2[24] = -08
var square2 = 0
var diceRoll2 = 0

repeat {
    // move up or down for a snake or ladder
    square2 += board2[square]
    // roll the dice
    diceRoll2 += 1
    if diceRoll2 == 7 { diceRoll2 = 1 }
    // move by the rolled amount
    square2 += diceRoll2
} while square2 < finalSquare
print("Game over!")

// 4. 조건 구문
// 1) If
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
// -> else절은 옵셔널, 제외 가능

let temperatureInCelsius = 25
let weatherAdvice: String


if temperatureInCelsius <= 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice)
//-> 더 간결하게 코드 작성 가능
let weatherAdvice2 = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice2)

// If 표현식의 모든 구문은 동일한 타입의 값 포함
let freezeWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}
// -> freezeWarning 은 옵셔널 문자열이라고 명시적으로 작성되어야 함
// 위 코드 또 다른 방법 -> freezeWarning에 대한 타입을 명시적으로 제공하는 대신에 nil에 대한 타입을 명시적으로 제공하는 것
let freezeWarning2 = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}

// 에러를 전파하거나 반환하지 않는 fatalError(_:file:line:) 과 같은 함수를 호출하여 예기치 않은 실패 표현 가능
let weatherAdvice = if temperatureInCelsius > 100 {
    throw TemperatureError.boiling
} else {
    "It's a reasonable temperature."
}

// 2) Switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}

// 명시적 Fallthrough
// C의 switch 구문과 다르게 Swift의 switch 구문은 기본적으로 각 케이스의 바닥에서 다음 케이스로 바로 실행되지 않음
// 명시적으로 break 구문 요청 없이 처음 일치하는 switch 케이스가 완료되자마자 switch 구문 전체가 종료
// 각 케이스 = 반드시 적어도 하나의 실행가능한 구문 포함
let anotherCharacter2: Character = "a"
switch anotherCharacter {
case "a": // Error!
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 콤마 이용 -> 하나로 결합하여 구성 가능
let anotherCharacter3: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 간격일치
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// 튜플
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 값 바인딩
// switch 케이스는 일치하는 값 또는 값들을 임시적 상수 또는 변수로 이름을 가질 수 있다
let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// Where : switch 케이스는 추가 조건으로 where 절을 사용할 수 있다
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x,y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// 합성 케이스 -> 콤마
let someCharacter2: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
//값 바인딩 포함 가능
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// 5. 제어 변경 구문 -> continue, break, fallthrough, return, throw
// 1) continue : 루프를 통해 다음 반복을 시작하려고 멈추기위해 부릅니다.
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Charater] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput) //grtmndsthnklk

// 2) break : 전체 제어흐름 구문을 즉시 종료
let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."

// 3) fallthrough : C처럼 다음 케이스로 넘어가려면 fallthrough 키워드로 케이스 별로 동작을 선택할 수 O
// Swift에서 switch 구문은 각 케이스의 맨 아래에서 다음 케이스로 넘어가지 않는다.
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."

// 라벨이 있는 구문
/* <#label name#>: while <#condition#> {
     <#statements#>
   }*/
//뱀과 사다리 예시
let finalSquare3 = 25
var board3 = [Int](repeating: 0, count: finalSquare3 + 1)
board3[03] = +08; board3[06] = +11; board3[09] = +09; board3[10] = +02
board3[14] = -10; board3[19] = -11; board3[22] = -02; board3[24] = -08
var square3 = 0
var diceRoll3 = 0

gameLoop: while square3 != finalSquare3 {
    diceRoll3 += 1
    if diceRoll3 == 7 { diceRoll3 = 1 }
    switch square3 + diceRoll3 {
    case finalSquare3:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square3 += diceRoll3
        square3 += board3[square]
    }
}
print("Game over!")


// 6. 이른 종료
// guard 구문 : 표현식의 부울 값에 따라 구문을 실행
// guard 구문의 다음을 실행하기 위해 반드시 조건이 참인 것을 요구하기 위해 사용
// if 구문과 반대로 guard 구문은 항상 else 절을 가지고 있습니다. else 절 안의 코드는 조건이 참이 아닐 경우에 실행됩니다.
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."


// 7. 연기된 동작
// defer : 코드 일부분이 실행되는 시기를 제어 -> 현재 범위의 마지막에 실행되는 코드블럭을 작성하기 위해 defer 블럭을 사용
var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}
// Prints "6"

//프로그램이 어떻게 종료하는지에 관계없이 defer 안의 코드는 항상 수행
var score2 = 3
if score2 < 100 {
    score2 += 100
    defer {
        score2 -= 100
    }
    // Other code that uses the score with its bonus goes here.
    print(score2) // Prints "103"
}
// ->  점수에 100을 더하고 뺌으로써 임시로 보너스를 주는 코드(결국 100을 다시 뺌!)

// 같은 범위에 하나 이상의 defer 블럭을 작성하면 첫번째 defer 블럭은 마지막에 수행
if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}
// Prints "The score is:"
// Prints "6"

// 8. 사용 가능한 API 확인 : Swift는 주어진 타겟에서 사용 불가능한 API를 실수로 사용하는 것을 막기위해 사용 가능한 API 확인(checking API availability)을 제공
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
// -> iOS에서 위의 특정 가용성 조건의 if 구문의 본문은 iOS 10 이상 버전에서만 실행되고 macOS에서는 macOS 10.12 이상 버전에서만 실행됩니다. 마지막 인수 * 는 필수이며 다른 플랫폼에서 if 의 본문이 최소 타겟 버전에서 실행되도록 지정합니다.
// 일반적인 형식에서 가용성 조건은 플랫폼 이름 및 버전 리스트를 사용
/* if #available(<#platform name#> <#version#>, <#...#>, *) {
     <#statements to execute if the APIs are available#>
   } else {
     <#fallback statements to execute if the APIs are unavailable#>
}*/
// guard 구문과 함께 가용성 조건을 사용할 때 이것은 코드 블럭에서 나머지 코드에 대한 가용성 정보를 구체화
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}
// -> 위의 예제에서 ColorPreference 구조체는 macOS 10.12 이상을 요구, chooseBestColor() 함수는 가용성 가드로 시작

//#available 이외에도 Swift 는 비가용성 조건을 사용하여 반대로 확인할 수도 있다
if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {
    // Fallback code
}

























