import UIKit


/*For-In 루프*/

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names
{
    print("Hello, \name")
}


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs 
{
    print("\(animalName)s have \(legCount) legs")
}
//딕셔너리의 키-값 쌍 접근

let base = 3
let power = 10
var answer = 1
for _ in 1...power
{
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// 3^10

let minutes = 60
for tickMark in 0..<minutes
{}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval)
{}


let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval)
{}


/*while*/

let finalsquare = 25
var board = [Int](repeating: 0, count: finalsquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalsquare
{
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    if square < board.count
    {
        square += board[square]
    }
}
print("game over!")



repeat{
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    
    square += diceRoll
} while square < finalsquare
            print("Game over!")
            
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32
{
    print("It's very cold")
}

/*조건 구문*/
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 
{
    print("It's very cold. Consider wearing a scarf.")
} 
else if temperatureInFahrenheit >= 86
{
    print("It's not that cold. Wear a T-shirt.")
}
else
{
    print("~")
}


/*case*/
let somecharacter: Character = "z"
switch somecharacter
{
case "a":
    print("a")
case "b":
    print("b")
default:
    print("s")
}

let anotherCharater: Character = "a"
let message = switch anotherCharater{
case "a":
    "asdasd"
case "z":
    "asdasdqwd"
default:
    "some other character"
}

print(message)
// message에 SWITCH함수

// switch 뒤에 break 없어도 되고, case "a", "A": 이렇게 표현 가능 + 뒤에 명령문 꼭 있어야함

let somePoint = (1, 1)
switch somePoint 
{
case (0, 0):
    print("asdqw")
case(_, 0):
    print("asd")
case(-2...2, -2...2):
    print("asdasd")
default:
    print("asdkla")
}

// 튜플도 가능


let yetAnotherPoint = (1, -1)
switch yetAnotherPoint{
case let (x,y) where x == y: 
    print("asd")
case let (x,y) where x == -y:
    print("qwqd")
case let (x,y):
    print("asdqwd")
}
//where 추가조건


/*이른종료*/
func greet(person: [String: String])
{
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else{
        print("I hope ~")
        return
    }
    
    print("I hope in \(location)")
          
}

/*연기된 동작*/
var score = 1
if score < 10
{
    defer{
        print(score)
    }
    score += 5
}

//if구문의 범위가 종료되기 전에 score을 보여주는 연기된 코드가 수행됩니다.

/*사용가능한 API 확인*/
if #available(iOS 10,macOS 10.12, *) {
    //statement 만약 API 들이 가능할때
} else {
    //아닐때 statement
}


